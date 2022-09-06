Rails.application.routes.draw do
  resources :blogs do
    collection do
      post 'test'
    end
    member do
      post 'test_member'
    end
  end

  namespace :admin do
    resources :blogs
  end


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
