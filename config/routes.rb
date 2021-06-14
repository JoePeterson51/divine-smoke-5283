Rails.application.routes.draw do

  get '/plots', to: 'plots#index'
  delete '/plots/:id/plants/:plant_id', to: 'plots#destroy'

  get 'gardens/:id', to: 'gardens#show'

end
