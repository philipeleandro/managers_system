# frozen_string_literal: true

module Admin
  module Applier
    class Create
      def initialize(args = {})
        @applier_build = args[:applier_build]
      end

      def call
        creation = @applier_build.save

        response(creation)
      end

      private

      def response(validation)
        { success: validation,
          applier: @applier_build }
      end
    end
  end
end
