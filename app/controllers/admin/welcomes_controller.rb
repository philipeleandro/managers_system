# frozen_string_literal: true

module Admin
  class WelcomesController < Admin::ApplicationController
    before_action :authorize_by_action, only: %i[index]

    def index
      instance = Admin::Welcome::List.new(
        dashboard: dashboard,
        order: order,
        params: params,
        scoped_resource: User.all
      ).call

      render locals: {
        resources: instance[:resources],
        search_term: instance[:search_term],
        page: instance[:page],
        show_search_bar: true
      }
    end

    private

    def authorize_by_action
      @resource_class = authorize_resource(User)
    end
  end
end
