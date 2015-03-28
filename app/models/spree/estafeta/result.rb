class Spree::Estafeta::Result
	include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :result_code, :result_description, :result_spanish_description, :valid


  def persisted?
  	false
  end
end