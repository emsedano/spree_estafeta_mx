class Spree::Estafeta::WaybillRange
	include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :initial_waybill, :final_waybill

 def persisted?
    false
  end
  
  def to_h 
    {
      'initialWaybill' => initial_waybill,
      'finalWaybill'=> final_waybill
    }
  end
end