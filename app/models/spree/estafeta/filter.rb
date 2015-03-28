class Spree::Estafeta::Filter
	include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :filter_information, :filter_type

  def persisted?
    false
  end
  
  
  def to_h 
    {
      'filterInformation' => filter_information,
      'filterType' => filter_type
    }
  end
  
end 