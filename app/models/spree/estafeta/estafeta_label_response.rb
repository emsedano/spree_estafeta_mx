class Spree::Estafeta::EstafetaLabelResponse
	include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :global_result, :label_pdf, :label_request_list, :valid

  def persisted?
  	false
  end
  
end