class CostsController < ApplicationController
     
    def show

        begin
            cost_service = CostService.new(cost_params[:origin], cost_params[:destination], cost_params[:weight])

            @cost = cost_service.calculate();
        
            json_response(@cost)

        rescue ArgumentError => e
            json_response({ message: e.message }, :'bad_request')
        end

    end

    def cost_params
        params.permit(:origin, :destination, :weight)
    end
end
