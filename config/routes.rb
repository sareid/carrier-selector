Rails.application.routes.draw do

  resources :technical_reports, only: [:index]
  resources :carriers, only: [:index, :show]
  root "home#index"

end
