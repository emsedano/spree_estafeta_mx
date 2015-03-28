class Spree::Estafeta::EstafetaExecuteQueryRequest
	include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :suscriber_id, :login, :password, :search_type, :search_configuration
  
   def persisted?
    false
  end

  def to_h

    #{ 'ExecuteQuery' => 
      {
        'searchType' => search_type.to_h,
        'searchConfiguration' => search_configuration.to_h
     # }
    }
  end

end