# frozen_string_literal: true

module Admin
  module Applier
    class Update
      def initialize(args = {})
        @applier = args[:applier]
        @params = args[:params]
      end

      def call
        @applier.update(@params)
      end
    end
  end
end
