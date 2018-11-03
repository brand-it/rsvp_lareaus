# frozen_string_literal: true

Rails.application.routes.draw do
  resources :rsvp_guests, only: %i[show new create]

  get 'rsvp_guests', action: :new, controller: 'rsvp_guests'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'rsvp_guests#new'
  devise_for :admins, controllers: { sessions: 'admins/sessions' }

  namespace :admins do
    resources :rsvp_guests, only: %i[update edit destroy index]
  end
end
