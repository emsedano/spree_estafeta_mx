class Spree::Estafeta::EstafetaLabelRequest
	include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :quadrant, :valid, :password, :label_description_list_count, :login, :customer_number, :label_description_list, :suscriber_id, :paper_type

  validates_presence_of :valid, :password, :label_description_list_count, :login, :customer_number, :label_description_list, :suscriber_id, :paper_type

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end


  def persisted?
    false
  end

  def to_h
    { 
      "EstafetaLabelRequest" => {
        'valid' => "#{valid}",
        'labelDescriptionListCount' => label_description_list_count,
        'labelDescriptionList' => label_description_list.map(&:to_h),
        'paperType' => paper_type,
        'quadrant' => quadrant
      }
      
    }
  end
end