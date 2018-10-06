# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'weddings/new', type: :view do
  # before(:each) do
  #   assign(:wedding, Wedding.new)
  # end

  it 'renders new wedding form' do
    render

    # assert_select 'form[action=?][method=?]', wedding_path, 'post' do
    # end
  end
end
