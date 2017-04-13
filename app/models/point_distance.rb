class PointDistance < ApplicationRecord
    belongs_to :origin, :class_name => 'Point'
    belongs_to :destination, :class_name => 'Point'

    # validation
    validates_presence_of :distance, :origin, :destination
end
