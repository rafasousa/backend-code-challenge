class CostController < ApplicationController
     
    # GET /costs
    def index

        begin
            @cost = Point.calculate_cost(cost_params[:origin], cost_params[:destination], cost_params[:weight]);
        
            json_response(@cost)

        rescue ArgumentError => e
            json_response({ message: e.message }, :'bad_request')
        end

    end

    def cost_params
        params.permit(:origin, :destination, :weight)
    end
end
