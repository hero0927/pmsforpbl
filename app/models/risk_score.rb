class RiskScore < ActiveRecord::Base
  belongs_to :risk_item
  
  def risk_score
  	return generation_rate * influence_rate
  end
end
