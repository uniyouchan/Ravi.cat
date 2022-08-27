Rails.application.routes.draw do
 #管理者ログイン
 devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
 sessions: "admin/sessions"
 }
 namespace :admin do
 root to: 'customers#index'
  get "search" => "searches#search"
  resources :customers
  resources :cats do
   resources :comments, only: [:create, :destroy]
  end
 end

 #会員ログイン
 devise_for :customers,skip: [:passwords], controllers: {
 registrations: "public/registrations",
 sessions: 'public/sessions'
 }
 post '/guests/guest_sign_in', to: 'public/guests#new_guest'
 root to: 'public/homes#top'
 get 'about' =>'public/homes#about'
 get "search" => "public/searches#search"
 scope module: :public do

  resources :customers
  resources :addresses
  resources :messages, only: [:create]
  resources :rooms, only: [:create, :index, :show]
  resources :cats do
   resources :comments, only: [:create, :destroy]
   resource :favorites, only: [:create, :destroy]
  end
 end

end
