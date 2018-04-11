Rails.application.routes.draw do
  post '/distance/', to: 'api/v1/paths#index', as: 'distance'
  get '/cost/', to: 'api/v1/costs#index', as: 'cost'
end
