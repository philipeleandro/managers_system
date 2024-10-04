# frozen_string_literal: true

module Admin
  module Role
    class Destroy
      def initialize(args = {})
        @role = args[:role]
      end

      def call
        destroy_process = @role.destroy ? true : false

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
