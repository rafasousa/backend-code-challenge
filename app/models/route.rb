class Route
  attr_reader :distances

  def initialize(distance = nil, path = nil)
    @distances = []

    if path.present?
      @distances << path.distances 
    end

    if distance.present?
      @distances << distance
    end

    @distances.flatten!
  end

  def total_distance
    sum_distance = 0
    distances.each { |r| sum_distance += r.distance }
    return sum_distance
  end
  
end
