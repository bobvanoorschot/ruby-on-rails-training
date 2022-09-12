# frozen_string_literal: true

Rails.application.routes.draw do
  get 'form/first_step'
  get 'form/second_step'
  get 'form/third_step'
  post 'form/first_step', to: 'form#submit_first'
  post 'form/second_step', to: 'form#submit_second'
  post 'form/third_step', to: 'form#submit_third'

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
