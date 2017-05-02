class Point < ApplicationRecord
  # model association
  #has_many :point_distances, dependent: :destroy

  # validations
  validates_presence_of :name

  def self.calculate_cost(origin_id, destination_id, weight)

    if weight.to_f  == 0 || weight.to_f  > 50
      raise ArgumentError.new('Ops, Peso inválido deve ser entre 1 a 50 =(')
    end

    origin = self.find(origin_id)
    
    destination = self.find(destination_id)

    origin_distances = PointDistance.where(origin_id: origin.id)

    destination_distances = PointDistance.where(destination_id: destination.id)

    distance_value = 0
    values = []

    for origin_distance in origin_distances do
      if origin_distance.destination_id == destination.id && origin_distance.origin_id == origin.id
         if distance_value < origin_distance.distance
          distance_value = origin_distance.distance
        end
      else
        next_near_point = destination_distances.find {|s| s.origin_id == origin_distance.destination_id && s.destination_id == destination.id }
        if !next_near_point.nil?
          new_val = origin_distance.distance + next_near_point.distance 
          if new_val < distance_value
            distance_value = new_val
          end
          values.push(new_val)
        end
      end
    end

    if distance_value == 0
      raise ArgumentError.new('Ops, Nenhum ponto de entrega encontrado =(')
    end

    cost = distance_value * weight.to_f * 0.15

    return cost, origin_distances, values, destination_distances
    
  end

end
