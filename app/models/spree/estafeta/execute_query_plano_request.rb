class Spree::Estafeta::ExecuteQueryPlanoRequest
    
    include ActiveModel::Validations
    include ActiveModel::Conversion
    extend ActiveModel::Naming
    
    attr_accessor :initial_waybill, :final_waybill,:waybill_type,:waybills,:type, 
        :include_dimensions,:include_waybill_replace_data,:include_return_document_data, 
        :include_multiple_service_data, :include_international_data,:include_signature,
        :include_customer_info,:include_history,:history_type,:filter_information,:filter_type
    
    def to_h
        {

            "initialWaybill" => initial_waybill,
            "finalWaybill" => final_waybill,
            "waybillType" => waybill_type,
            "waybills" => waybills,
            "type" => type,
            "includeDimensions" => include_dimensions,
            "includeWaybillReplaceData" => include_waybill_replace_data,
            "includeReturnDocumentData" => include_return_document_data,
            "includeMultipleServiceData" => include_multiple_service_data,
            "includeInternationalData" => include_international_data,
            "includeSignature" => include_signature,
            "includeCustomerInfo" => include_customer_info,
            "includeHistory" => include_history,
            "historyType" => history_type,
            "filterInformation" => filter_information,
            "filterType" => filter_type
        }
    end

    def to_soap_xml

        waybills_array = ""
        waybills.each {|w| waybills_array += "<string>#{w}</string>"}
        
        "<Envelope xmlns=\"http://schemas.xmlsoap.org/soap/envelope/\">
            <Body>
                <ExecuteQueryPlano xmlns=\"http://www.estafeta.com/\">
                    <suscriberId>%s</suscriberId>
                    <login>%s</login>
                    <password>%s</password>
                    <initialWaybill>#{initial_waybill}</initialWaybill>
                    <finalWaybill>#{final_waybill}</finalWaybill>
                    <waybillType>#{waybill_type}</waybillType>
                    <waybills>
                        #{waybills_array}
                    </waybills>
                    <type>#{type}</type>
                    <includeDimensions>#{include_dimensions}</includeDimensions>
                    <includeWaybillReplaceData>#{include_waybill_replace_data}</includeWaybillReplaceData>
                    <includeReturnDocumentData>#{include_return_document_data}</includeReturnDocumentData>
                    <includeMultipleServiceData>#{include_multiple_service_data}</includeMultipleServiceData>
                    <includeInternationalData>#{include_international_data}</includeInternationalData>
                    <includeSignature>#{include_signature}</includeSignature>
                    <includeCustomerInfo>#{include_customer_info}</includeCustomerInfo>
                    <includeHistory>#{include_history}</includeHistory>
                    <historyType>#{history_type}</historyType>
                    <filterInformation>#{filter_information}</filterInformation>
                    <filterType>#{filter_type}</filterType>
                </ExecuteQueryPlano>
            </Body>
        </Envelope>" % [
              Rails.application.config.estafeta_service[:suscriber_id2],
              Rails.application.config.estafeta_service[:login2],
              Rails.application.config.estafeta_service[:password2]
        ]
    end
end