class Api::AgentClientsController < ApplicationController
  # API only needs to return json response
  respond_to :json

  def index
    respond_with AgentClient.all
  end

  def show
    respond_with AgentClient.find(params[:id])
  end

  # for DEMO #
  # call an agent by name and "run" task -> create log record
  def agent_call
    begin
      agent = AgentClient.find_by(name: params[:name])
      task = agent.task
      log = TaskLog.new(
        task_id: task.id,
        start_datetime: DateTime.now(),
        exc_status: TaskLog::EXC_STATUS[rand(0..1)] # randomize result status
      )
      # ensure save
      if !log.save
        raise agent.errors
      else
        # calculate time to run
        end_dt, exc_time = log.exc_times
        log.update_attributes({end_datetime: end_dt, exc_time: exc_time})
      end
      # return response
      render json: {
        agent: agent,
        task: task,
        log: log
      }
    rescue => e
      render json: {
        error: e.message
      }
    end
  end

end
