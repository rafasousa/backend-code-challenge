require 'rails_helper'

# Test suite for the PointDistance model
RSpec.describe PointDistance, type: :model do
  
  # Validation test
  # ensure column name is present before saving
  it { should validate_presence_of(:distance) }

  it { should validate_presence_of(:origin) }

  it { should validate_presence_of(:destination) }
end