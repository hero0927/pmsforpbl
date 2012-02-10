class PresentationTemplate < ActiveRecord::Base
	has_many :slide_templates, :autosave => true
end
