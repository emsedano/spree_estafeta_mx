class Spree::Estafeta::SearchConfiguration
	include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :include_dimensions, :include_waybill_replace_data, :include_return_document_data,
                  :include_multiple_service_data, :include_international_data, :include_signature, :include_customer_info,
                  :history_configuration, :filter_type

 def persisted?
    false
  end
  
  def to_h 
    {
      'includeDimensions' =>          include_dimensions,
      'includeWaybillReplaceData' =>  include_waybill_replace_data,
      'includeReturnDocumentData' =>  include_return_document_data,
      'includeMultipleServiceData'=>  include_multiple_service_data,
      'includeInternationalData'=>    include_international_data,
      'includeSignature' =>           include_signature,
      'includeCustomerInfo' =>        include_customer_info,
      'historyConfiguration' =>       history_configuration.to_h,
      'filterType' =>                 filter_type.to_h
    }
  end
  
end