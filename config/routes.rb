Rails.application.routes.draw do

  resources :items

  resources :lists

  resources :users
  get 'welcome/index'

end
