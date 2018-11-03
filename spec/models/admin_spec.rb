# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Admin, type: :model do
  let(:admin) { create :admin }
  describe '#inactive_message' do
    subject { admin.inactive_message }
    it { expect { subject }.to_not raise_exception }
  end

  describe '#active_for_authentication?' do
    subject { admin.active_for_authentication? }
    it { expect { subject }.to_not raise_exception }
  end
end
