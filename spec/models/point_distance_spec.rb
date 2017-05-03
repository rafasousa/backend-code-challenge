require 'rails_helper'

RSpec.describe PointDistance, type: :model do
  
  it { should validate_presence_of(:distance) }

  it { should validate_presence_of(:origin) }

  it { should validate_presence_of(:destination) }
end