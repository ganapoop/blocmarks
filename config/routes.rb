Rails.application.routes.draw do
  get 'likes/index'

  resources :topics do
    resources :bookmarks, only: [:new, :create]
  end
  resources :bookmarks, except: [:index]
  resources :likes, only: [:index, :create, :destroy]
  devise_for :users

  get 'welcome/index'

  get 'welcome/about'

  root 'welcome#index'

  get 'freelancers/index'
end
