# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Project.create(:login=>"PJ01", :password=>"PJ01",:password_confirmation=>"PJ01", :year=>"2011",
 :team_name=>"Pomodoro", :project_name=>"PMSforPBL", :project_type=>"pbl", :project_state=>"run", 
 :year=>"2012", :project_start_date=>"2011/10/1", :project_completion_date=>"2012/3/10", :project_stats_start_date=>"2011/10/5",
 :login_limit=>"0")
 
# Project.create(:login=>"PJ02", :password=>"PJ02",:password_confirmation=>"PJ02", :year=>"2011", 
#  :team_name=>"SAITY", :project_name=>"RSMPlanning", :project_type=>"pbl", :project_state=>"run", 
# :year=>"2012", :project_start_date=>"2011/10/1", :project_completion_date=>"2012/3/10", :project_stats_start_date=>"2011/10/5",
# :login_limit=>"0")
 
#Project.create(:login=>"PJ03", :password=>"PJ03",:password_confirmation=>"PJ03", :year=>"2011", 
# :team_name=>"core5", :project_name=>"anti-cancer-hogehoge", :project_type=>"pbl", :project_state=>"run",
# :year=>"2012", :project_start_date=>"2011/10/1", :project_completion_date=>"2012/3/10", :project_stats_start_date=>"2011/10/5",
# :login_limit=>"0")
 
#Project.create(:login=>"PJ04", :password=>"PJ04",:password_confirmation=>"PJ04", :year=>"2011", 
# :team_name=>"fivestar", :project_name=>"agri-", :project_type=>"pbl", :project_state=>"run", 
# :year=>"2012", :project_start_date=>"2011/10/1", :project_completion_date=>"2012/3/10", :project_stats_start_date=>"2011/10/5",
# :login_limit=>"0")

Pmo.create(:login=>"yamatos", :password=>"yamatos",:password_confirmation=>"yamatos", :login_limit=>"0")
