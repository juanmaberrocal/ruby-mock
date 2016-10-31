class CreateTaskLogsTable < ActiveRecord::Migration
  def change
    create_table :task_logs do |t|
    	t.references :task, index: true, foreign_key: true
    	t.datetime :start_datetime
    	t.datetime :end_datetime
    	t.decimal :exc_time
    	t.string :exc_process # same as task name (?)
    	t.string :exc_status

    	# add timestamps
    	t.timestamps
    end
  end
end
