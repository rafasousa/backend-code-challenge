class Route
  attr_reader :distances

  def initialize(distance = nil, path = nil)
    @distances = []
    @distances << path.distances if path.present?
    @distances << distance if distance.present?
    @distances.flatten!
  end

  def get_sum_distance
    sum_distance = 0
    distances.each { |r| sum_distance += r.distance }
    return sum_distance
  end
  
end
