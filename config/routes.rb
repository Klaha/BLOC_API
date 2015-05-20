Rails.application.routes.draw do

  namespace :api, defaults: { format: :json } do
    resources :users
  end
  
  resources :items
  resources :lists
  get 'welcome/index'

end
