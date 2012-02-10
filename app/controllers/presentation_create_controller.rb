class PresentationCreateController < ApplicationController
  before_filter :require_user
  def index
    @pre_pbl = Presentation.where(:project_type => 'pbl').order('create_date').last
    @slides_pbl = @pre_pbl.slide.order('user_id')

    @pre_rdp = Presentation.where(:project_type => 'rdp').order('create_date').last
    @slides_rdp = @pre_rdp.slide.order('user_id')

  end

  def show_slide
    @slide = Slide.find(params[:id])
  end
end
