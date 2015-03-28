class Spree::Estafeta::Util
	
	def self.prepare_estafeta_label_request(order)
		
		destination_info = Spree::Estafeta::ShipmentInfo.new
		
		shipping_address = order.shipping_address
		
		destination_info.address1 = shipping_address.address1	
		destination_info.neighborhood	= shipping_address.address2
		destination_info.city = shipping_address.city
		destination_info.contact_name = "#{shipping_address.firstname} #{shipping_address.lastname}"
		destination_info.corporate_name = shipping_address.fiscal_name
		destination_info.customer_number = Rails.application.config.estafeta_service[:customer_number]
		destination_info.neighborhood = shipping_address.address2
		destination_info.phone_number = shipping_address.phone
		destination_info.state = shipping_address.state.name
		destination_info.valid = "True"
		destination_info.zip_code = shipping_address.zipcode
		destination_info.cell_phone = shipping_address.phone

		origin_info = Spree::Estafeta::ShipmentInfo.new

		origin_info.address1 = "Prado Norte 525"
		origin_info.address2 = "105C"
		origin_info.city = "MIGUEL HIDALGO"
		origin_info.contact_name = "Fernando "
		origin_info.corporate_name = "Ingredienta"
		origin_info.customer_number = Rails.application.config.estafeta_service[:customer_number]
		origin_info.neighborhood = "LOMAS DE CHAPULTEPEC"
		origin_info.phone_number = "5540-5128"
		origin_info.state = "DF"
		origin_info.valid = "True"
		origin_info.zip_code = "11000"
		origin_info.cell_phone = "5540-5128"

		dr_alternative_info = Spree::Estafeta::DRAlternativeInfo.new

		dr_alternative_info.address1 = shipping_address.address1	
		dr_alternative_info.neighborhood	= shipping_address.address2
		dr_alternative_info.city = shipping_address.city
		dr_alternative_info.contact_name = "#{shipping_address.firstname} #{shipping_address.lastname}"
		dr_alternative_info.corporate_name = shipping_address.fiscal_name
		dr_alternative_info.customer_number = Rails.application.config.estafeta_service[:customer_number]
		dr_alternative_info.neighborhood = shipping_address.address2
		dr_alternative_info.phone_number = shipping_address.phone
		dr_alternative_info.state = shipping_address.state.name
		dr_alternative_info.valid = "True"
		dr_alternative_info.zip_code = shipping_address.zipcode
		dr_alternative_info.cell_phone = shipping_address.phone

		label_description_list = []

		label_description = Spree::Estafeta::LabelDescription.new
		label_description.content = "Ingredienta food products"
		label_description.delivery_to_estafeta_office = "False"
		label_description.number_of_labels = 1
		label_description.office_num = "130"
		label_description.parcel_type_id = 4
		label_description.reference = "#{order.number}"
		label_description.aditional_info = order.special_instructions || ""
		label_description.return_document = "False"
		label_description.service_type_id_doc_ret = "50"
		label_description.service_type_id = "70"
		label_description.valid = "True"
		label_description.weight = 4
		label_description.origin_zip_code_for_routing = order.shipping_address.zipcode
		label_description.content_description = "Ingredienta food products"
		label_description.origin_info = origin_info
		label_description.dr_alternative_info = dr_alternative_info
		label_description.destination_info = destination_info

		label_description_list << label_description

		request  = Spree::Estafeta::EstafetaLabelRequest.new
		request.valid = "True"
		request.label_description_list_count = 1
		request.paper_type = 1
		request.quadrant = 0
		request.label_description_list = label_description_list
		
		request.to_h
	end
	
	def self.prepare_estafeta_execute_query(shipments)
	  
	  search_type = Spree::Estafeta::SearchType.new
	  search_type.type = "L"
	  
	  search_type.waybill_list = Spree::Estafeta::WaybillList.new
	  search_type.waybill_list.waybill_type = "G"
	  search_type.waybill_list.waybills = shipments
	  
	  
	  search_configuration = Spree::Estafeta::SearchConfiguration.new
	  
	  search_configuration.include_dimensions = 1
	  search_configuration.include_waybill_replace_data = 0
	  search_configuration.include_return_document_data = 0
	  search_configuration.include_multiple_service_data = 0
	  search_configuration.include_international_data = 0
	  search_configuration.include_signature = 0
	  search_configuration.include_customer_info = 1
	  
	  search_configuration.history_configuration = Spree::Estafeta::HistoryConfiguration.new
	  search_configuration.history_configuration.include_history = 1
	  search_configuration.history_configuration.history_type = "ALL"
	  
	  search_configuration.filter_type = Spree::Estafeta::Filter.new
	  search_configuration.filter_type.filter_information = 1
	  search_configuration.filter_type.filter_type = "DELIVERED"
	  
	  request = Spree::Estafeta::EstafetaExecuteQueryRequest.new
	  
	  request.search_type = search_type
	  request.search_configuration = search_configuration
	  
	  request.to_h
	end


	def self.prepare_estafeta_execute_query_plano(shipments)

		request = Spree::Estafeta::ExecuteQueryPlanoRequest.new
		
	  request.type = "L"
	  request.waybill_type = "G"
	  request.waybills = shipments	  
	  request.include_dimensions = 0
	  request.include_waybill_replace_data = 0
	  request.include_return_document_data = 0
	  request.include_multiple_service_data = 0
	  request.include_international_data = 0
	  request.include_signature = 0
	  request.include_customer_info = 1
	  request.include_history = 0
	  request.history_type = "ALL"	 
	  request.filter_information = 0
	  request.filter_type = "ALL"
		request.to_soap_xml

	end
	
end