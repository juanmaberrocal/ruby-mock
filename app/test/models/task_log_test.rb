require 'test_helper'

class TaskLogTest < ActiveSupport::TestCase
  # validate presence: task_id
  # ensure task log cannot be saved without an associated task
  test "Log-Task Association Validation" do
  	task_log = TaskLog.new
  	assert !task_log.save
  end

  # ensure task saves with all attrs
  test "Task Log Save All Attrs" do
    # get fixture task
    task = Task.all.sample
    # randomize start|end|execution time
    start_dt, end_dt, exc_time = TaskLog.random_exc_times(task)
  	task_log = TaskLog.new(
      task_id: task.id, 
  		start_datetime: start_dt,
  		end_datetime: end_dt,
      exc_time: exc_time,
      exc_status: TaskLog::EXC_STATUS[rand(0..1)] # get available status randomly
  	)
  	assert task_log.save
  end

  # ensure task log is associated to task
  test "Log-Task Association" do
    task_log = TaskLog.all.sample
    assert_instance_of Task, task_log.task
  end

  # ensure exc_process method
  test "Task Log exc_process Method" do
    task_log = TaskLog.all.sample
    assert (task_log.exc_process != "No associated task!") # exc_process is rescued to string
  end

end
