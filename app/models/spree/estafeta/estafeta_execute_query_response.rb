class Spree::Estafeta::EstafetaExecuteQueryResponse
	include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :suscriber_id, :login, :password, :search_type
  
   def persisted?
    false
  end
  
end