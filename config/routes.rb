# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  root 'groups#index'

  resources :groups do
    resources :expenses, except: [:edit, :update]
  end
end
