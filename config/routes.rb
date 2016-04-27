Rails.application.routes.draw do

  get 'carriers/data', :defaults => { :format => 'json' }
  get 'carriers/usData', :defaults => { :format => 'json' }
  resources :technical_reports, only: [:index]
  resources :carriers, only: [:index, :show, :data, :usData]

  root "home#index"

end
