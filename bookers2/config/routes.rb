Rails.application.routes.draw do
  devise_for :users

  root to: 'homes#top'
  get "/home/about" => "homes#about"

  resources :users do
    resource :relationships
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end

  resources :books do
    resource :favorites
    resources :book_comments
  end

end
