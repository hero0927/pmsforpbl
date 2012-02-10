class SlideTemplate < ActiveRecord::Base
  belongs_to :presentation_template
  has_and_belongs_to_many :data_factories, :autosave => true
  
  def getSlideData(param)
  	data_arr = Array.new
  	data_factories.each do |fact|
  		data_arr << fact.getSlideData(param)
  	end
  	return data_arr
  end
end
