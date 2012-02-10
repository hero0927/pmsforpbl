class Risk < ActiveRecord::Base
  belongs_to :user
  has_many   :risk_items
end
