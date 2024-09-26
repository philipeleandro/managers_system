# frozen_string_literal: true

module Admin
  class ApplicationController < Administrate::ApplicationController
    helper FieldsHelper

    before_action :authenticate_user!
    before_action :authenticate_admin

    def authenticate_admin
      return if current_user.admin?

      redirect_to destroy_user_session_path
    end

    private

    def authorize_by_action
      case params[:action].to_sym
      when :index then @resource_class = authorize_resource(resource_class)
      when :create
        resource = new_resource(resource_params)

        @resource_class = authorize_resource(resource)
      end
    end

    # Override this value to specify the number of elements to display at a time
    # on index pages. Defaults to 20.
    # def records_per_page
    #   params[:per_page] || 20
    # end
  end
end
