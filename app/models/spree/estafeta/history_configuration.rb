class Spree::Estafeta::HistoryConfiguration
	include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :include_history, :history_type

 def persisted?
    false
  end
  
  def to_h 
    {
      'includeHistory' => include_history,
      'historyType' => history_type
    }
    
  end
end