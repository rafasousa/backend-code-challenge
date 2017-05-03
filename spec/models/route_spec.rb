require 'rails_helper'

describe Route, type: :model do
    describe '.new' do
        context 'when has only distance' do
            subject { described_class.new(distance) }

            let(:distance) { PointDistance.new }

            it 'adds distance' do
                expect(subject.distances).to eq([distance])
            end
        end
        context 'when has distance and path' do
            subject { described_class.new(distance, path) }

            let(:path) { Route.new(distance_old) }
            let(:distance_old) { PointDistance.new }
            let(:distance) { PointDistance.new }

            it 'adds two distances' do
                expect(subject.distances).to eq([distance_old, distance])
            end
        end

        it 'has distances as Array' do
            expect(subject.distances).to be_a(Array)
        end
    end

end