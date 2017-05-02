class PointDistancesController < ApplicationController
  before_action :set_point_distance, only: [:show, :update, :destroy]

  # GET /point_distances
  def index
    @distances = PointDistance.all
    json_response(@distances)
  end

  # GET /point_distances/:id
  def show
    json_response(@distance)
  end

  # POST /point_distances
  def create
    @distance = PointDistance.create!(distance_params)
    json_response(@distance, :created)
  end

  # PUT /point_distances/:id
  def update
    @distance.update(distance_params)
    head :no_content
  end

  # DELETE /point_distances/:id
  def destroy
    @distance.destroy
    head :no_content
  end

  private

  def distance_params
    params.permit(:origin_id, :destination_id, :distance)
  end

  def set_point_distance
    @distance = PointDistance.find(params[:id])
  end
end
