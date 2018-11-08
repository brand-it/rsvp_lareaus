# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'pages/registries', type: :view do
  it 'renders new wedding form' do
    render
    assert_select 'a', count: 1, text: 'Amazon'
  end

  # it 'all form inputs have a name' do
  #   render
  #   assert_select 'form input' do
  #     assert_select '[name="rsvp_guest\[first_name\]"]'
  #     assert_select '[name="rsvp_guest\[last_name\]"]'
  #     assert_select '[name="rsvp_guest\[email\]"]'
  #     assert_select '[name="rsvp_guest\[attending\]"]'
  #     assert_select '[name="rsvp_guest\[total_adults\]"]'
  #     assert_select '[name="rsvp_guest\[total_children\]"]'
  #   end
  # end
end
