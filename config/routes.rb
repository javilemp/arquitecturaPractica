Rails.application.routes.draw do
  get 'posts/index'
  get 'posts/show'
  post 'posts', to: 'posts#create', as: 'create_post'
  resources :posts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
