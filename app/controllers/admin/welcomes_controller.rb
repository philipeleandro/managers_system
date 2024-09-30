# frozen_string_literal: true

module Admin
  class WelcomesController < Admin::ApplicationController
    before_action :authorize_by_action, only: %i[index]

    def index
      search_term = params[:search].to_s.strip
      resources = filter_resources(User.all, search_term: search_term)
      resources = apply_collection_includes(resources)
      resources = order.apply(resources)
      resources = paginate_resources(resources)
      page = Administrate::Page::Collection.new(dashboard, order: order)

      render locals: {
        resources: resources,
        search_term: search_term,
        page: page,
        show_search_bar: true
      }
    end

    private

    def authorize_by_action
      @resource_class = authorize_resource(User)
    end
  end
end
