# frozen_string_literal: true

module Admins
  class AdminsController < Admins::ApplicationController
    def index
      @admins = Admin.all
    end
  end
end
