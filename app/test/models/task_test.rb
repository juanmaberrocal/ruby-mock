require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  # validate presence: name
  # ensure task cannot be saved without a name
  test "Task Name Validation" do
  	task = Task.new
  	assert !task.save
  end

  # ensure task saves with all attrs
  test "Task Save All Attrs" do
  	task = Task.new(
  		name: 'Test', 
  		exc_path: '~/some/test/path',
  		start_datetime: (DateTime.now - (rand(0..10)).days),
  		end_datetime: (DateTime.now + (rand(0..10)).days),
  		exc_days: Task.random_exc_days,
  		server_key: SecureRandom.hex
  	)
  	assert task.save
  end

  # ensure task has [] association to task logs
  test "Task-Log Association" do
    task = Task.all.sample
    assert_instance_of TaskLog::ActiveRecord_Associations_CollectionProxy, task.task_logs # ensure collection and not just plain array
  end

end
