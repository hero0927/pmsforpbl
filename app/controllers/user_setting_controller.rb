# coding: utf-8
class UserSettingController < ApplicationController
  before_filter :require_user
  def index

  end

  def Update
    if @current_user.type == 'Project'
      @current_user.password = params[:password]
      @current_user.password_confirmation = params[:password_confirmation]
      @current_user.project_name = params[:project_name]
      @current_user.team_name = params[:team_name]
      start = Date.new(params[:start][:year].to_i, params[:start][:month].to_i, params[:start][:day].to_i)
      completion = Date.new(params[:completion][:year].to_i, params[:completion][:month].to_i, params[:completion][:day].to_i)
      stats = Date.new(params[:stats][:year].to_i, params[:stats][:month].to_i, params[:stats][:day].to_i)
      @current_user.project_start_date = start
      @current_user.project_completion_date = completion
      @current_user.project_stats_start_date = stats
      @current_user.project_state = params[:project_state]
    else
      @current_user.password = params[:password]
      @current_user.password_confirmation = params[:password_confirmation]
    end
    respond_to do |format|
      if   @current_user.save
        flash[:success] = "変更成功"
        format.html {redirect_to :back}
      else
        flash[:password_errors] = "同じパスワードを入力してください"
        format.html {redirect_to :action => 'index' }
      end
    end
  end
end
