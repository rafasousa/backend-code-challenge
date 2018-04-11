require 'rails_helper'

RSpec.describe Path, :type => :model do
  before do
    Path.create source: 'A', destination: 'B', distance: 20
  end
  context 'already in DB' do
    it 'then overwrite' do
      expect(subject.create_update(:source => 'A', :destination => 'B', :distance => 20)).to eq("Path Updated!")
    end
  end
  context 'not in BD' do
    it 'then create new' do
      expect(subject.create_update(:source => 'Z', :destination => 'B', :distance => 20)).to eq("Path Created!")
    end
  end
end
