require 'test_helper'

class TaskLogsControllerTest < ActionController::TestCase
  setup do
    @task_log = task_logs(:task_log_one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:task_logs)
  end
end
