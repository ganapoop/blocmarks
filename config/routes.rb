Rails.application.routes.draw do
  resources :topics do
    resources :bookmarks, only: [:new, :create]
  end
  resources :bookmarks, except: [:index]
  devise_for :users

  get 'welcome/index'

  get 'welcome/about'

  root 'welcome#index'
  
  get 'freelancers/index'
end
