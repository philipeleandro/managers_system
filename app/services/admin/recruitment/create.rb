# frozen_string_literal: true

module Admin
  module Recruitment
    class Create
      def initialize(args = {})
        @recruitment_build = args[:recruitment_build]
      end

      def call
        creation = @recruitment_build.save

        response(creation)
      end

      private

      def response(validation)
        { success: validation,
          recruitment: @recruitment_build }
      end
    end
  end
end
