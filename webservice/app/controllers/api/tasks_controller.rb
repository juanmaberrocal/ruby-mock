class Api::TasksController < ApplicationController
  # API only needs to return json response
  respond_to :json

  def index
    respond_with Task.all
  end

  def show
    respond_with Task.find(params[:id])
  end

end
