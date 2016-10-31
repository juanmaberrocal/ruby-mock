class TaskLogsController < ApplicationController
  # GET /task_logs
  # GET /task_logs.json
  def index
    @task_logs = TaskLog.all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task_log
      @task_log = TaskLog.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_log_params
      params.fetch(:task_log, {}).permit(:task_id, :start_datetime, :end_datetime, :exc_time, :exc_status)
    end
end
