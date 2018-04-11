class Path < ApplicationRecord
  def create_update(params)
    if Path.exists?(source: params[:source], destination: params[:destination])
      path = Path.find_by(source: params[:source], destination: params[:destination])
      path.distance = params[:distance]
      path.save
      return "Path Updated!"
    else
      path = Path.new
      path.source = params[:source].upcase!
      path.destination = params[:destination].upcase!
      path.distance = params[:distance]
      path.save
      return "Path Created!"
    end
  end
end
