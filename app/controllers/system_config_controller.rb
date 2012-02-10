class SystemConfigController < ApplicationController
  def index
    @project = Project.all
    @pmo = Pmo.all
    year = Date.today.month < 4 ? Date.today.year - 1 : Date.today.year
    @newusername = year.to_s + "_PJ" + rand(100).to_s
    while Project.where(:login => @newusername).exists? do
      @newusername = year.to_s + "_PJ" + rand(100).to_s
    end

    @slt_pbl = SubmitLimitTimer.find_by_project_type('pbl')
    @slt_rdp = SubmitLimitTimer.find_by_project_type('rdp')

  end

  def show_project
    @selected_user = Project.find(params[:id])
  end

  def show_pmo
    @selected_user = Pmo.find(params[:id])
  end

  def create

    @newuser = Project.new;
    @newuser.login = params[:login]
    @newuser.password = params[:login]
    @newuser.password_confirmation = params[:login]
    @newuser.team_name = params[:login]
    @newuser.project_name = params[:login]
    @newuser.project_type = params[:project_type]
    @newuser.project_state = 'run'
    @newuser.year = Date.today.year.to_i
    @newuser.project_start_date = Date.today
    @newuser.project_completion_date = Date.today
    @newuser.project_stats_start_date = Date.today
    @newuser.login_limit = false;

    respond_to do |format|
      if @newuser.save
        format.html { redirect_to :back }
      else
        format.xml { render :xml => @newuser.errors }
      end
    end
  end

  def update_delete
    @project = Project.find(params[:id])
    if params[:update]
      @project.password = params[:password]
      @project.password_confirmation = params[:login]
      @project.team_name = params[:team_name]
      @project.project_name = params[:project_name]
      @project.project_type = params[:project_type]
      @project.project_state = params[:project_state]
      @project.year = params[:year]
      if params[:login_limit] == nil
      @project.login_limit = false
      else
      @project.login_limit = true
      end
    @project.save

    elsif params[:delete]
    @project.destroy
    end
    redirect_to :back
  end

  def update_pmo
    @pmo = Pmo.find(params[:id])
    @pmo.password = params[:password]
    @pmo.save
  end

  def date_update

    @slt = SubmitLimitTimer.find(params[:id])
    @slt.limit_weekday_start = params[:limit_weekday_start]
    @slt.limit_weekday_end = params[:limit_weekday_end]
    @slt.limit_time_start = params[:date][:start]
    @slt.limit_time_end = params[:date][:end]
    @slt.dead_line_weekday = params[:dead_line_weekday]

    @slt.save
    redirect_to :back
  #render :text=>params[:date].inspect
  end
end
