class Cost
  # TAX HERE
  TAX = 0.15
  def calculate_route(params)
    r = Path.all
    m = []
    r.each {|value| m << [value.source, value.destination, value.distance]}
    if Path.find_by(source: params[:origin]).nil? then return "Error: Path not found!" end
    ob = Dijkstra.new(params[:origin], params[:destination], m)
    if ob.cost.kind_of?(Array) || ob.cost == Float::INFINITY
      return "Error: Path not found!"
    else
      ob.cost * params[:weight].to_f * TAX
    end
  end
end
