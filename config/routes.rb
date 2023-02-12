Rails.application.routes.draw do
  root to: "homes#top"
  
  #利用者用
  devise_for :users,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
  get "search" => "searches#search"
  

  namespace :public do
    #投稿関連
    resources :posts, only: [:new,:index,:show,:edit,:create,:destroy,:update] do
      resource :favorites, only: [:create,:destroy]
      resources :post_comments, only: [:create,:destroy]
    end
    
    #ユーザー関連
    resources :users, only: [:index,:show,:edit,:update] do
      resource :relationships, only: [:create,:destroy]
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
      member do #ユーザーidが含まれてるurlを使えるように=>(publiusers/:id/favorites)になる
        get :favorites
      end
    end
    
  end

  #管理者用
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
