class HomeController < ApplicationController
  before_filter :require_user
  def pmo
    @pbl = Project.find_all_by_project_type_and_project_state('pbl', 'run');
    @rdp = Project.find_all_by_project_type_and_project_state('rdp', 'run');
    @slt_pbl = SubmitLimitTimer.find_by_project_type('pbl')
    @slt_rdp = SubmitLimitTimer.find_by_project_type('rdp')
  end

  def project
    @project = @current_user

    #@evm = @project.evms.last   #=> 登録初期はnilになってるから、考慮しないとダメ。
    @evm = Evm.new
    @limittime = Time.new(2012,1,31,18,0,0)
  end

  def pjinfo
  end

end
