module Api
  module V1
    class PathsController < ApplicationController
      before_action :path_validations
      def index
        path = Path.new
        render json: path.create_update(params)
      end
    end
  end
end
