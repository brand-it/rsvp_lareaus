# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Admins::AdminsController, type: :controller do
  let(:admin) { create :admin }

  before { sign_in admin }

  describe 'GET #index' do
    subject(:get_index) { get :index }

    it { expect(get_index.status).to eq 200 }
  end
end
