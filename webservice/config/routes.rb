Rails.application.routes.draw do
  # build rest api routes
  namespace :api, defaults: {format: 'json'} do
    # invoke agent to run task manually through api (demo purpose)
    get 'agent_call/:name', to: 'agent_clients#agent_call', as: 'agent_call'

    resources :agent_clients, only: [:index, :show]
    resources :tasks, only: [:index, :show]
    resources :task_logs, only: [:index, :show]
  end

  # root to display available api
  root 'api#index'
end
