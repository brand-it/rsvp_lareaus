# frozen_string_literal: true

class ApplicationController < ActionController::Base
  respond_to :html, :json

  # this render dynamic / static data for
  def pages
    respond_to do |format|
      format.html do
        render "pages/#{params[:page_name]}"
      end
    end
  end
end
