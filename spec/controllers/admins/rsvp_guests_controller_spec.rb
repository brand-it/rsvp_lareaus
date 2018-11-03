# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Admins::RsvpGuestsController, type: :controller do
  # This should return the minimal set of attributes required to create a valid
  # Wedding. As you add validations to Wedding, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { build(:rsvp_guest).attributes }

  let(:invalid_attributes) do
    { first_name: nil, last_name: nil }
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # WeddingsController. Be sure to keep this updated too.
  let(:valid_session) { {} }
  let(:rsvp_guest) { create :rsvp_guest }
  let(:admin) { create :admin }
  before { sign_in admin }

  describe 'GET #index' do
    before { rsvp_guest }
    subject { get :index }
    it { expect(subject.status).to eq 200 }
  end

  describe 'DELETE #destroy' do
    before { rsvp_guest }
    subject { delete :destroy, params: { id: rsvp_guest }, format: 'json' }
    it { is_expected.to be_successful }
  end
end
