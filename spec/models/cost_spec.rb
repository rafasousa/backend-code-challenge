require 'rails_helper'

RSpec.describe Cost, :type => :model do
  before do
    Path.create source: 'A', destination: 'B', distance: 10
    Path.create source: 'B', destination: 'C', distance: 15
    Path.create source: 'A', destination: 'C', distance: 30
    Path.create source: 'N', destination: 'D', distance: 20
  end
  context 'when path found' do
    it 'should return the cost' do
      expect(subject.calculate_route(:origin => 'A', :destination => 'C', :weight => 5)).to eq(18.75)
    end
  end
  context 'path not found' do
    it 'should return error message' do
      expect(subject.calculate_route(:origin => 'A', :destination => 'D', :weight => 5)). to eq('Error: Path not found!')
    end
  end
end
