class Spree::Estafeta::SearchType
	include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :type, :waybill_range, :waybill_list

 def persisted?
    false
  end
  
  def to_h 
    {
      'type' => type,
      #'waybillRange' => waybill_range.to_h,
      'waybillList' => waybill_list.to_h
    }
  end
  
end