# frozen_string_literal: true

json.extract! wedding, :id, :created_at, :updated_at
json.url wedding_url(wedding, format: :json)
