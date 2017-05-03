class CostService
  include ActiveModel::Validations

  attr_reader :origin, :destination, :weight

  validates :weight, inclusion: { in: 1..50 }

  def initialize(origin, destination, weight)
  
    @distances = []   
    @weight = weight.to_i
    @destination_id = destination.to_i
    
    get_distances(origin.to_i)
    
  end
    
  def calculate()

      results = find_distances_recursive()
      
      if results.present?
          return results.total_distance * weight * 0.15
      else
          return nil
      end
  end

  def find_distances_recursive
    
    distance = @distances.sort_by(&:total_distance).first
    
    return if distance.blank?

    next_distance = distance.distances.last.destination

    return distance if next_distance.id == @destination_id

    get_distances(next_distance, distance)
    
    @distances.delete(distance)

    find_distances_recursive
  end

  private

  def get_distances(origin_id, route = nil)
    
    PointDistance.where(origin_id: origin_id).each do |d|        
        new_route = Route.new(d, route)
        @distances.push(new_route)
    end

  end

end
