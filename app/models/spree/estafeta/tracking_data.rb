class Spree::Estafeta::TrackingData
    
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :waybill,:short_waybill_id,:service_id,:service_description_SPA,:service_description_eng,
      :customer_number,:package_type,:additional_information,:status_spa,:status_eng,:pickup_data,
      :delivery_data,:dimensions,:waybill_replace_data,:return_document_data,:multiple_Service_data,
      :international_data,:customer_info,:history,:signature
    
  def initialize(h)
  	
	  h.each do |k,v| 
	  	
	  	send("#{k}=",v)	if respond_to?("#{k}=")
	  end
	end

	def persisted?
		false
	end

end    