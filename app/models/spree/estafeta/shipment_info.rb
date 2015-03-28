class Spree::Estafeta::ShipmentInfo
 	include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :address1, :address2, :city, :contact_name, :corporate_name, :customer_number, :neighborhood, :phone_number, :state,
  							:valid, :zip_code, :cell_phone


  def persisted?
    false
  end

  def to_h
  	map = {
  		'address1' => address1.upcase,  		
  		'city' => city.upcase,
  		'contactName' => contact_name.truncate(50).upcase,
  		'corporateName' => corporate_name.present? ? corporate_name.truncate(50).upcase : "NA",
  		'customerNumber' => customer_number.upcase,
  		'phoneNumber' => phone_number.upcase,
  		'state' => state.upcase,
  		'valid' => "#{valid}",
  		'zipCode' => zip_code.upcase,
  		'cellPhone' => cell_phone
  	}
  	map['address2'] = address2.upcase if address2.present?
  	map['neighborhood'] = neighborhood.upcase if neighborhood.present?
  	map
  end
end	