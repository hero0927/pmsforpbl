class RiskItem < ActiveRecord::Base
  belongs_to :risk
  has_many   :risk_scores
end
