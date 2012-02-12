class UserSettingController < ApplicationController
  def index
      @project = @current_user
    render :text => @current_user
  end

  def Update
    @project = @current_user
    render :text => @current_user
    # @project.password = params[:password]
    # @project.project_name = params[:project_name]
    # @project.team_name = params[:team_name]
    # start = Date.new(params[:start][:year].to_i, params[:start][:month].to_i, params[:start][:day].to_i)
    # completion = Date.new(params[:completion][:year].to_i, params[:completion][:month].to_i, params[:completion][:day].to_i)
    # stats = Date.new(params[:stats][:year].to_i, params[:stats][:month].to_i, params[:stats][:day].to_i)
    # @project.project_start_date = start
    # @project.project_completion_date = completion
    # @project.project_stats_start_date = stats
    # @project.project_state = params[:project_state]
    # respond_to do |format|
      # if   @project.save
        # format.html {redirect_to :back}
      # else
        # format.json {render json: @test.errors, status: :unprocessable_entity}
      # end
    # end
  end
end
