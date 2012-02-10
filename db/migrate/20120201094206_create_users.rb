class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :login
      t.string :crypted_password
      t.string :password_salt
      t.string :persistence_token
      t.string :type
      t.string :team_name
      t.string :project_name
      t.string :project_type
      t.string :project_state
      t.integer :year
      t.date :project_start_date
      t.date :project_completion_date
      t.date :project_stats_start_date
      t.boolean :login_limit

      t.timestamps
    end
  end
end
