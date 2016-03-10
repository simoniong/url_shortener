Rails.application.routes.draw do
  root "urls#index"
  resources :urls, only: [:index, :new, :create]
  resources :urls, :only => ['show'], :path => '/'
end
