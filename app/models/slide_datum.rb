class SlideDatum < ActiveRecord::Base
  belongs_to :slide
  serialize  :data
  serialize  :measured_date
end
