module Api
  module V1
    class CostsController < ApplicationController
      before_action :cost_validations
      def index
        cost = Cost.new
        render json: cost.calculate_route(params)
      end
    end
  end
end
