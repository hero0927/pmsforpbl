class CreateSubmitLimitTimers < ActiveRecord::Migration
  def change
    create_table :submit_limit_timers do |t|
      t.string :limit_weekday_start
      t.string :limit_weekday_end
      t.integer :limit_time_start
      t.integer :limit_time_end
      t.string :dead_line_weekday
      t.string :project_type

      t.timestamps
    end
  end
end
