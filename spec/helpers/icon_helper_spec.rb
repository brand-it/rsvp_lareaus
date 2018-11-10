# frozen_string_literal: true

require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the IconHelper. For example:
#
# describe IconHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe IconHelper, type: :helper do
  describe '#icon' do
    context 'when linkedin' do
      subject { icon('linkedin') }

      it { is_expected.to eq '<i class="fa fa-linkedin"></i>' }
    end

    context 'when linkedin with size' do
      subject { icon('linkedin', size: 'sm') }

      it { is_expected.to eq '<i class="fa fa-sm fa-linkedin"></i>' }
    end
  end
end
