Rails.application.routes.draw do

  resources :carriers, only: [:index, :show]
  root "home#index"

end
