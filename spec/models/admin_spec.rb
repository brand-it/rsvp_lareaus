# frozen_string_literal: true

# == Schema Information
#
# Table name: admins
#
#  id                     :bigint(8)        not null, primary key
#  approved               :boolean          default(FALSE), not null
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_admins_on_approved              (approved)
#  index_admins_on_email                 (email) UNIQUE
#  index_admins_on_reset_password_token  (reset_password_token) UNIQUE
#

require 'rails_helper'

RSpec.describe Admin, type: :model do
  let(:admin) { create :admin }

  describe '#inactive_message' do
    subject(:inactive_message) { admin.inactive_message }

    it { expect { inactive_message }.not_to raise_exception }
  end

  describe '#active_for_authentication?' do
    subject(:active_for_authentication?) { admin.active_for_authentication? }

    it { expect { active_for_authentication? }.not_to raise_exception }
  end
end
