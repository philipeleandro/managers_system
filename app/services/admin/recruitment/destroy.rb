# frozen_string_literal: true

module Admin
  module Recruitment
    class Destroy
      def initialize(args = {})
        @recruitment = args[:recruitment]
      end

      def call
        destroy_process = @recruitment.destroy ? true : false

        response(destroy_process)
      end

      private

      def response(validation)
        { success: validation,
          message: validation ? 'destroy.success' : '<br/>' }
      end
    end
  end
end
