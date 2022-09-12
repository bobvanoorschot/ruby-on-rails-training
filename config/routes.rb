# frozen_string_literal: true

Rails.application.routes.draw do
  get 'form/name_step'
  get 'form/address_step'
  get 'form/payment_step'
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
