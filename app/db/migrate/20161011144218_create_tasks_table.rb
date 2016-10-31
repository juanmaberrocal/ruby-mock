class CreateTasksTable < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
    	t.string :name
    	t.string :exc_path
    	t.datetime :start_datetime
    	t.datetime :end_datetime
    	t.text :exc_days # serialized by rails to array
    	t.string :server_key

    	# add timestamps
    	t.timestamps
    end
  end
end
