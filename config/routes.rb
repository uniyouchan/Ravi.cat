Rails.application.routes.draw do
 #管理者ログイン
 devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
 sessions: "admin/sessions"
 }
 namespace :admin do
 root to: 'homes#top'
  get "search" => "searches#search"
  resources :customers, only: [:index,:show,:edit,:update] do
  end
  resources :cats
  resources :genres, except: [:new, :show]
 end

 #会員ログイン
 devise_for :customers,skip: [:passwords], controllers: {
 registrations: "public/registrations",
 sessions: 'public/sessions'
 }
 root to: 'public/homes#top'
 get 'about' =>'public/homes#about'
 get "search" => "public/searches#search"
 scope module: :public do
  resources :addresses
  get "/customers/mypage" => "customers#show"
  get "/customers/edit" => "customers#edit"
  resources :customers
  resources :cats
 end

end
