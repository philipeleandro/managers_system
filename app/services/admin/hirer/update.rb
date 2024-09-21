# frozen_string_literal: true

module Admin
  module Hirer
    class Update
      def initialize(args = {})
        @hirer = args[:hirer]
        @params = args[:params]
      end

      def call
        @hirer.update(@params)
      end
    end
  end
end
