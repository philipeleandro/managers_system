# frozen_string_literal: true

module Admin
  module Hirer
    class Destroy
      def initialize(args = {})
        @hirer = args[:hirer]
      end

      def call
        destroy_process = @hirer.destroy ? true : false

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
