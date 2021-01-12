# frozen_string_literal: true

RSpec.describe Location do
  let(:args) { { x: 1, y: 2} }
  describe '#initialize' do
    subject do
      described_class.new(args)
    end
    it 'should store the new coordinates of a location' do
      expect(subject.x).to eq 1
      expect(subject.y).to eq 2
    end
  end

  describe '#position' do
    subject do
      described_class.new(args).position
    end
    it 'should express the location in an x,y array' do
      expect(subject).to eq([1, 2])
    end
  end

  describe 'immutability of location' do
    subject do
      described_class.new(args)
    end
    it 'should not be able to set the location using an x,y array' do
      expect(subject).not_to respond_to(:position=)
      expect(subject).not_to respond_to(:x=)
      expect(subject).not_to respond_to(:y=)
    end
  end
end
