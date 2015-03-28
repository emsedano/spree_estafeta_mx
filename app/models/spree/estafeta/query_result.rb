class Spree::Estafeta::QueryResult
    
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming


  attr_accessor :error_code, :error_code_description_spa, :error_code_description_eng, 
  		:tracking_data
  
  def initialize(h)
  	
	  h.each do |k,v| 

	  	send("#{k}=",v)	if respond_to?("#{k}=")
	  	
	  	if k.eql? :tracking_data

	  		trackings = []

	  		self.tracking_data[:tracking_data].each do |tracking|
	  			trackings << Spree::Estafeta::TrackingData.new(tracking)
	  		end
	  		self.tracking_data= trackings
	  	end
	  end
	end

	def persisted?
  	false
  end

end    