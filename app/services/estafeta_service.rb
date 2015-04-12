require 'rubygems'
require 'savon'
require 'rexml/document'

class EstafetaService
  
  def initialize
    @request_label_client = Savon::Client.new do
      wsdl Rails.application.config.estafeta_service[:label_wsdl]
      #namespace Rails.application.config.estafeta_service[:label_namespace]
      endpoint Rails.application.config.estafeta_service[:label_endpoint]
      ssl_ca_cert_file 'lib/estafeta_ssl/labelrequestQA.pem'
      ssl_version :SSLv3
      ssl_verify_mode :peer 
    end
    
    @tracking_client = Savon::Client.new do
      wsdl Rails.application.config.estafeta_service[:tracking_wsdl]
      #namespace Rails.application.config.estafeta_service[:tracking_namespace]
      #endpoint Rails.application.config.estafeta_service[:tracking_endpoint]
      ssl_ca_cert_file 'lib/estafeta_ssl/labelQueryQAv1.pem'
      ssl_version :SSLv3
      ssl_verify_mode :peer 
    end

    @auth_message = {
      'password' => Rails.application.config.estafeta_service[:password],
      'customerNumber' => Rails.application.config.estafeta_service[:customer_number],
      'login' => Rails.application.config.estafeta_service[:login],
      'suscriberId' => Rails.application.config.estafeta_service[:suscriber_id]
    }

    @auth_message2 = {
      'password' => Rails.application.config.estafeta_service[:password2],
      'login' => Rails.application.config.estafeta_service[:login2],
      'suscriberId' => Rails.application.config.estafeta_service[:suscriber_id2]
    }

  end

  
  def create_label_request(order)
    
    response = nil
    message = Spree::Estafeta::Util.prepare_estafeta_label_request order
    prepare_message(message["EstafetaLabelRequest"])
    
    begin
      
      response = @request_label_client.call(:create_label, :message => message, response_parser: :rexml)
      
    rescue Exception => e
      #deliver a failure mail
      puts e
    end

    if response.present?
      parse_label_response response 
    else
      nil
    end

  end
  
  
  def execute_query(shipments)
    
    message = Spree::Estafeta::Util.prepare_estafeta_execute_query shipments
    prepare_message2 message#['ExecuteQuery']
    
    response = @tracking_client.call :execute_query, :message => message    
    
  end

  def execute_query_plano(trackings)
    
    soap_xml_request = Spree::Estafeta::Util.prepare_estafeta_execute_query_plano trackings
    
    response = @tracking_client.call :execute_query_plano, :xml => soap_xml_request

    Spree::Estafeta::QueryResult.new(response.body[:execute_query_plano_response][:execute_query_plano_result])
    
  end
  
  protected

    def prepare_message(message)
      message.merge!(@auth_message)
    end

    def prepare_message2(message)
      message.merge!(@auth_message2)
    end

    def parse_label_response(xml_response)
      
      response = Spree::Estafeta::EstafetaLabelResponse.new
      puts xml_response.to_hash
      xml_response.to_hash[:multi_ref].each do |ref|

        if ref[:"@id"] == "id0"
          
          response.label_pdf = ref[:label_pdf]
          response.valid = ref[:valid]
          response.label_request_list = []

        elsif ref[:"@id"] == "id1" || ref[:"@id"] == "id2"
          
          result = Spree::Estafeta::Result.new
      
          result.result_code = ref[:result_code]
          result.result_description = ref[:result_description]
          result.result_spanish_description = ref[:result_spanish_description]
          result.valid = [:valid]
          
          response.global_result = result if ref[:"@id"] == "id1" 
          response.label_request_list << result if ref[:"@id"] == "id2" 

        end         
      end
      
      response
    end


    

end