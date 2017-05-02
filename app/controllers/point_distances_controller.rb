class PointDistancesController < ApplicationController
  
  # GET /point_distances
  def show
    @distances = PointDistance.all
    json_response(@distances)
  end

  # POST /point_distances
  def create

    @distance = PointDistance.find_or_create_by(origin_id: distance_params[:origin_id],
                                          destination_id: distance_params[:destination_id])

    @distance.distance = distance_params[:distance]

    if @distance.valid? && @distance.save
      json_response(@distance, :created)     
    else
      json_response(@distance, :unprocessable_entity)
    end

  end

  private

  def distance_params
    params.permit(:origin_id, :destination_id, :distance)
  end
end
