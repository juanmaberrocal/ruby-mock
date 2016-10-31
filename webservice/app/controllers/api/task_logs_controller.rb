class Api::TaskLogsController < ApplicationController
  # API only needs to return json response
  respond_to :json

  def index
    respond_with TaskLog.all
  end

  def show
    respond_with TaskLog.find(params[:id])
  end

end
