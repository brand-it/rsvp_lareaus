# frozen_string_literal: true

Rails.application.routes.draw do
  resources :rsvp_guests
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'rsvp_guests#new'
end
