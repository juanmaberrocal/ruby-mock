Rails.application.routes.draw do
  resources :agent_clients
  resources :tasks
  resources :task_logs, only: [:index]

  root 'dashboard#index'
end
