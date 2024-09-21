# frozen_string_literal: true

module Admin
  module Hirer
    class Create
      def initialize(args = {})
        @hirer_build = args[:hirer_build]
      end

      def call
        creation = @hirer_build.save

        response(creation)
      end

      private

      def response(validation)
        { success: validation,
          hirer: @hirer_build }
      end
    end
  end
end
