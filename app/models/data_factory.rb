class DataFactory < ActiveRecord::Base
	has_and_belongs_to_many :slide_templates
	def getSlideData(param)
		return nil
	end
end
