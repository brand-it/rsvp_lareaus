# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'rsvp_guests/new', type: :view do
  before do
    assign(:rsvp_guest, RsvpGuest.new)
  end

  it 'renders new wedding form' do
    render
    assert_select 'form[action=?][method=?]', rsvp_guests_path, 'post'
  end

  it 'all form inputs have a name' do # rubocop:disable RSpec/ExampleLength
    render
    assert_select 'form input' do
      assert_select '[name="rsvp_guest\[first_name\]"]'
      assert_select '[name="rsvp_guest\[last_name\]"]'
      assert_select '[name="rsvp_guest\[email\]"]'
      assert_select '[name="rsvp_guest\[attending\]"]'
      assert_select '[name="rsvp_guest\[total_adults\]"]'
      assert_select '[name="rsvp_guest\[total_children\]"]'
    end
  end
end
