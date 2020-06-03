Rails.application.routes.draw do
  devise_for :admins,controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
}
  devise_for :users,controllers: {
  sessions:      'users/sessions',
  passwords:     'users/passwords',
  registrations: 'users/registrations'
}

  #管理者側
  namespace :admins do
    resources :comics, only:[:index, :show, :new, :create, :edit, :update, :destroy]
  end
  post '/admins/comics/new' => 'admins/comics#create' #ルーティングエラー発生のため追記
  patch '/admins/comics/:id/edit' => 'admins/comics#update' #同上

 #ユーザ側
  root 'homes#top'
  get 'homes/top'
  get 'homes/about'

  resources :users
  resources :comics, only:[:index, :show] do
    resources :comments, only:[:create, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
