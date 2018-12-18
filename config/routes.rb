# frozen_string_literal: true

Rails.application.routes.draw do
  resources :rsvp_guests, only: %i[show new create]

  get 'rsvp_guests', action: :new, controller: 'rsvp_guests'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'rsvp_guests#new'
  devise_for :admins, controllers: { sessions: 'admins/sessions' }

  namespace :admins do
    resources :rsvp_guests, only: %i[update edit destroy index]
    resources :admins, only: %i[index update]
  end

  # Lowest of priority need to check this last
  # these are dynamic / static pages that we want to have simple displays.
  # don't abuse this code as it is tempting to use this for all those one off pages
  Dir[Rails.root.join('app/views/pages/*').to_s].map do |directory|
    page_name = File.basename(directory).split('.').first
    match page_name => 'application#pages', via: [:get], page_name: page_name
  end
end
