class PointDistance < ApplicationRecord
    belongs_to :origin, :class_name => 'Point'
    belongs_to :destination, :class_name => 'Point'

    validates_presence_of :distance, :origin, :destination
    validates :distance, inclusion: { in: 1..100_000 }
    validates :origin, presence: true
    validates :destination, presence: true
end
