Rails.application.routes.draw do
  root to: 'uploads#index'
  resource :uploads, only: [:new, :create]
  get '/patients', to: 'aws#index'
  get '/patients/*prefix', to: 'aws#subdirectory', as: 'directory', constraints: { prefix: /.*/ }
end
