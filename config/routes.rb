Rails.application.routes.draw do
  #get 'accesses/hello'
  #get 'accesses/goodbye'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'articles#index'
  patch '/articles/:article_id/comments/:id', to: 'comments#update', as: :update_comment
  resources :articles, only: [:show, :new, :create, :edit, :update, :destroy]
  resources :password_resets, only: [:new, :create, :edit, :update]
  resource :profile, only: [:show, :edit, :update]
  resources :articles do
    resources :comments, only:[:new, :create, :edit, :update, :destroy]
  end
end
