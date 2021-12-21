Rails.application.routes.draw do
  get '/login', to:'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/favorites', to: 'favorites#index'
  get '/search', to: 'users#search'

  root to: 'users#index'
  resources :users do
    resource :favorites, only: [:create, :destroy]
    get :followings, on: :member
    # フォローしている人を表示させるルーティング
    # on: :memberでルーティングにidを含めることができる
    get :followers, on: :member
    # フォロワーを表示するルーティング
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
