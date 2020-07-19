Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "articles#top"

  resources :users, only:[:show, :edit, :update]
  resources :articles do
    resources :article_comments, only:[:create, :destroy]
    resource :favorites, only:[:create, :destroy]
    collection do
      get 'ranking'
    end
  end

end
