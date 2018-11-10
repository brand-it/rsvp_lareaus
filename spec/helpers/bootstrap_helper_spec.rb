# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BootstrapHelper, type: :helper do
  include IconHelper
  describe '#bootstrap_alerts' do
    subject { bootstrap_alerts }

    it { is_expected.to eq '' }
    context 'when notice' do
      before { flash[:notice] = 'test' }

      it { is_expected.to include('alert-secondary') }
    end

    context 'when info' do
      before { flash[:info] = 'test' }

      it { is_expected.to include('alert-info') }
    end
  end
end
