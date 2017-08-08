Rails.application.routes.draw do
  root 'welcome#index'

  get 'welcome/index'

  get 'welcome/about'

  devise_for :users

  get 'likes/index'

  resources :topics do
    resources :bookmarks, only: [:new, :create]
  end

  resources :bookmarks, except: [:index]
  resources :likes, only: [:index, :create, :destroy]

  get 'freelancers/index'

  post :incoming, to: 'incoming#create'
end
