class PointDistance < ApplicationRecord
    belongs_to :origin, :class_name => 'Point'
    belongs_to :destination, :class_name => 'Point'

    validates :distance, inclusion: { in: 1..100_000 }
    validates_presence_of :distance, :origin, :destination
end
