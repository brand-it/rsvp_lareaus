# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'weddings/edit', type: :view do
  # before(:each) do
  #   @wedding = assign(:wedding, Wedding.create!)
  # end

  it 'renders the edit wedding form' do
    render

    # assert_select 'form[action=?][method=?]', wedding_path(@wedding), 'post' do
    # end
  end
end
