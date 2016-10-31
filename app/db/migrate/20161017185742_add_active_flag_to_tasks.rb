class AddActiveFlagToTasks < ActiveRecord::Migration
  def change
  	add_column :tasks, :active, :boolean
  end
end
