class ProjectViewController < ApplicationController
  before_filter :require_user
  def index
    @projects = Project.all
  end
end
