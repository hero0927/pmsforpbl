class TestController < ApplicationController
	def index
		# @projects = nil
		@pre  = Presentation.new
		@ptmp = PresentationTemplate.find(1)
		param = { :project_type => "pbl",
			  :presentation_template => @ptmp}
		@pre.make(param)
		
		# @ptmp = PresentationTemplate.new
		# @stmp = SlideTemplate.new
		# @pvgf = PV_GraphFactory.new
		# @stmp.graph_factories << @pvgf
		# @ptmp.slide_templates << @stmp
		# @ptmp.save
		
		# @project.evms.create({:pv => 10.0, :bac => 746, :sac => 116, :ev => 3.0, :ac => 1.4, :measured_date => '2011-11-01'})
		# @project.evms.create({:pv => 102.650, :bac => 746, :sac => 116, :ev => 15.0, :ac => 6.31, :measured_date => '2011-11-08'})
	end
end
