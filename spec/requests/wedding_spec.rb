# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Wedding', type: :request do
  describe 'GET /wedding' do
    it 'works! (now write some real specs)' do
      get wedding_path
      expect(response).to have_http_status(200)
    end
  end
end
