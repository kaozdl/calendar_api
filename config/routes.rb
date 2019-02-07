# frozen_string_literal: true

Rails.application.routes.draw do
  get 'user/Calendar'
  get 'user/Event'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :user do
    resources :calendar do
      resources :event
    end
  end
end
