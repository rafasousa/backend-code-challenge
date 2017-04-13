class Point < ApplicationRecord
  # model association
  #has_many :point_distances, dependent: :destroy

  # validations
  validates_presence_of :name
end
