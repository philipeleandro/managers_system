# frozen_string_literal: true

module Admin
  module Welcome
    class List
      def initialize(args = {})
        @dashboard = args[:dashboard]
        @order = args[:order]
        @params = args[:params]
        @scoped_resource = args[:scoped_resource]
      end

      def call
        { search_term: search_term,
          resources: resources,
          page: page }
      end

      private

      def resources
        resources = filter_resources(@scoped_resource, search_term: search_term)
        resources = apply_collection_includes(resources)
        resources = @order.apply(resources)
        paginate_resources(resources)
      end

      def search_term
        @params[:search].to_s.strip
      end

      def filter_resources(resources, search_term:)
        Administrate::Search.new(
          resources,
          @dashboard,
          search_term
        ).run
      end

      def apply_collection_includes(relation)
        resource_includes = @dashboard.collection_includes

        return relation if resource_includes.empty?

        # :nocov:
        relation.includes(*resource_includes)
        # :nocov:
      end

      def paginate_resources(resources)
        resources.page(@params[:_page]).per(records_per_page)
      end

      def page
        @page ||= Administrate::Page::Collection.new(@dashboard, order: @order)
      end

      def records_per_page
        @params[:per_page] || 20
      end
    end
  end
end
