class CostsController < ApplicationController
     
    def show
        service = CostService.new(cost_params[:origin], cost_params[:destination], cost_params[:weight])

        if !service.valid?
            return json_response({ error: 'Ops, Peso inválido, somente valores entre 1 a 50 =(' }, :'unprocessable_entity')
        end

        cost = service.calculate();
    
        if cost.present?
            json_response({ cost: cost })
        else
            json_response({ error: 'Ops, Nenhum ponto de entrega encontrado =(' }, :'not_found')
        end

    end

    def cost_params
        params.permit(:origin, :destination, :weight)
    end
end
