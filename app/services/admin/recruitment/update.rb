# frozen_string_literal: true

module Admin
  module Recruitment
    class Update
      def initialize(args = {})
        @recruitment = args[:recruitment]
        @params = args[:params]
      end

      def call
        @recruitment.update(@params)
      end
    end
  end
end
