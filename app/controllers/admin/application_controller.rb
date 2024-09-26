# frozen_string_literal: true

module Admin
  class ApplicationController < Administrate::ApplicationController
    helper FieldsHelper

    before_action :authenticate_user!
    before_action :authenticate_admin

    def authenticate_admin
      return if current_user.admin?

      sign_out(current_user)
    end

    # Override this value to specify the number of elements to display at a time
    # on index pages. Defaults to 20.
    # def records_per_page
    #   params[:per_page] || 20
    # end
  end
end
