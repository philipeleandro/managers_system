# frozen_string_literal: true

module Admin
  module Role
    class Update
      def initialize(args = {})
        @role = args[:role]
        @params = args[:params]
      end

      def call
        @role.update(@params)
      end
    end
  end
end
