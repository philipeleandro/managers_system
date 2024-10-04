# frozen_string_literal: true

module Admin
  module Role
    class Create
      def initialize(args = {})
        @role_build = args[:role_build]
      end

      def call
        creation = @role_build.save

        response(creation)
      end

      private

      def response(validation)
        { success: validation,
          role: @role_build }
      end
    end
  end
end
