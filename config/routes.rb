Rails.application.routes.draw do

  root 'welcome#index'

  get 'welcome/index'

  get 'welcome/about'

  get 'users/show'
  
  devise_for :users
  resources :users, only: [:show]

  resources :topics do
    resources :bookmarks, only: [:new, :create] do
      resources :likes, only: [:index, :create, :destroy]
    end
  end

  post :incoming, to: 'incoming#create'
end
