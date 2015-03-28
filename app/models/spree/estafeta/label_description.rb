class Spree::Estafeta::LabelDescription
	include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming


  attr_accessor :aditional_info, :content, :cost_center, :delivery_to_estafeta_office, :destination_country_id, :destination_info, 
  							:number_of_labels, :office_num, :origin_info, :parcel_type_id, :reference, :return_document, :service_type_id, :service_type_id_doc_ret,
  							:valid, :weight, :origin_zip_code_for_routing, :effective_date, :content_description, :dr_alternative_info

  def persisted?
    false
  end

  def to_h
  	{
  		'DRAlternativeInfo' => dr_alternative_info.to_h,
  		'aditionalInfo'     => aditional_info.present? ? aditional_info.truncate(22).upcase : "NA",
  		'content'   => content.truncate(25).upcase,
  		'contentDescription' => content_description.upcase,
  		'costCenter'  => "12345",
  		'deliveryToEstafetaOffice' => delivery_to_estafeta_office,
  		'destinationCountryId'  => "MX",
  		'destinationInfo' => destination_info.to_h,
  		'numberOfLabels'  => number_of_labels,
  		'officeNum'   => office_num,
  		'originInfo'  => origin_info.to_h,
  		'originZipCodeForRouting' => origin_zip_code_for_routing,
  		'parcelTypeId'   => parcel_type_id,
  		'reference'     => reference.upcase,
  		'returnDocument' => "#{return_document}",
  		'serviceTypeId'   => service_type_id.upcase,
  		'serviceTypeIdDocRet' => service_type_id_doc_ret.upcase,
  		'valid'   => "#{valid}",
  		'weight'  => weight,
  				  		  		
  		
  	}
  end
end
