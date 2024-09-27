# frozen_string_literal: true

module Admin
  module Applier
    class Destroy
      def initialize(args = {})
        @applier = args[:applier]
      end

      def call
        destroy_process = @applier.destroy ? true : false

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
