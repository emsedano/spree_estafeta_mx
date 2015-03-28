class Spree::Estafeta::WaybillList
	include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :waybill_type, :waybills

 def persisted?
    false
  end
  
  def to_h 
    #wayill_list =  []
    #waybills_list.each{|w| wayill_list << w } if waybills.any?
    #waybills_list = []
    {
      'waybillType' =>  waybill_type,
      'waybills' => waybills
    }
  end
end