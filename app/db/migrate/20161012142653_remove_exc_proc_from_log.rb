class RemoveExcProcFromLog < ActiveRecord::Migration
  def change
  	remove_column :task_logs, :exc_process, :string
  end
end
