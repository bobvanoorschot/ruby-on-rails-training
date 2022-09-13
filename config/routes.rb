# frozen_string_literal: true

Rails.application.routes.draw do
  get 'form/name_step'
  post 'form/name_step', to: 'form#name_submit'
  get 'form/address_step'
  patch 'form/address_step', to: 'form#address_submit'
  get 'form/payment_step'
  patch 'form/payment_step', to: 'form#payment_submit'
  get 'form/success_step'
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
