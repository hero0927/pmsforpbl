class PresentationViewController < ApplicationController
      before_filter :require_user
 # layout 'project_layout', :only => :index
 # layout 'slide_layout'
 
 
  def index
    #@project = @current_user
    #param = {:evms => @evms}
    #@evms = @project.currentRevision
    #param = {:evm => @evms}
    
    #@pvevac_f = PV_EV_AC_GraphFactory.new
    #@pvevac = @pvevac_f.getSlideData(param) #Viewで使用
    
    
    
    @day = Date.new(2012,2,7)
    @pre = Presentation.find_by_create_date(@day)

    @preslide = @pre.slides
    p @preslide
    @preslide.each do |preslide|
      p preslide
      print "\n"
    end
  end

  def fullscreen
    
  end
  
  def view
    @day = Date.new(2012,2,7)
    @pre = Presentation.find_by_create_date(@day)

    @preslide = @pre.slides
    @preslide.each do |preslide|
      p preslide
      print "\n"
    end
  end
end
