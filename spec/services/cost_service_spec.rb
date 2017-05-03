require 'rails_helper'

describe CostService do
    describe '.new' do
        subject { described_class.new(1, 3, 9) }

        it 'Set origin, destination and weight' do
        expect(subject.weight).to eq(9)
        end
    end

    describe '.calculate' do
        subject { described_class.new(1, 3, distance).calculate() }

        context 'when distance is 30 and result not ok' do
            let(:distance) { 30 }

            it 'Calculates shipping cost' do
                is_expected.to eq(nil)
            end
        end

        context 'when distance is 80 and result not ok' do
            let(:distance) { 80 }

            it 'Calculates shipping cost' do
                is_expected.to eq(nil)
            end
        end
    end
end