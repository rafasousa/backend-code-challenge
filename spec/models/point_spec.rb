require 'rails_helper'

# Test suite for the Point model
RSpec.describe Point, type: :model do
  # Validation tests
  # ensure columns name before saving
  it { should validate_presence_of(:name) }
end