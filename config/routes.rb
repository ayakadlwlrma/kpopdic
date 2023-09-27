Rails.application.routes.draw do
  devise_for :users, controllers: {   registrations: 'users/registrations',
  sessions: 'users/sessions' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:show]

  get 'posts/gen' => 'posts#gen'
  get 'posts/boy' => 'posts#boy'
  get 'posts/girl' => 'posts#girl'
  get 'posts/team' => 'posts#team'
  get 'posts/age' => 'posts#age'
  get 'posts/SM' => 'posts#SM'
  get 'posts/YG' => 'posts#YG'
  get 'posts/JYP' => 'posts#JYP'
  get 'posts/HYBE' => 'posts#HYBE'
  get 'posts/other' => 'posts#other'
  get 'posts/anzu' => 'posts#anzu'


  resources :posts ,only: [:index, :create, :show, :edit, :update, :destroy] do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create]
  end
  namespace :admin do
    resources :posts, only: [:new]
  end

  #カテゴリー分けに関係するところのみ記載
  root 'posts#index'
end
