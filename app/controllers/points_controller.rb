class PointsController < ApplicationController
  before_action :set_point, only: [:show, :update, :destroy]

  # GET /points
  def index
    @points = Point.all
    json_response(@points)
  end

  # POST /points
  def create
    @point = Point.create!(point_params)
    json_response(@point, :created)
  end

  # GET /points/:id
  def show
    json_response(@point)
  end

  # PUT /points/:id
  def update
    @point.update(point_params)
    head :no_content
  end

  # DELETE /points/:id
  def destroy
    @point.destroy
    head :no_content
  end

  private

  def point_params
    # whitelist params
    params.permit(:id, :name)
  end

  def set_point
    @point = Point.find(params[:id])
  end
end
