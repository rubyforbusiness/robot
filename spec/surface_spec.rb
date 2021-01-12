# frozen_string_literal: true

RSpec.describe Surface do
  let(:args) { { x: 1, y: 2} }
  describe '#initialize' do
    subject do
      described_class.new(args)
    end
    it 'should hold the size of the surface' do
      expect(subject.x).to eq 1
      expect(subject.y).to eq 2
    end
  end

  describe '#valid_location?' do
    let(:args) { { x: 1, y: 1 }}
    subject do
      described_class.new(args).valid_location?(location)
    end

    context 'off surface in y direction' do
      let(:location) { Location.new(x: 1, y: 2) }
      it 'should return false if location is off the surface' do
        expect(subject).to be false
      end
    end

    context 'off surface in x direction' do
      let(:location) { Location.new(x: 2, y: 1) }
      it 'should return false if location is off the surface' do
        expect(subject).to be false
      end
    end

    context '0,0' do
      let(:location) { Location.new(x: 0, y: 0) }
      it 'should return true if location is on the surface' do
        expect(subject).to be true
      end
    end

    context '-1,0' do
      let(:location) { Location.new(x: -1, y: 0) }
      it 'should return false if location is off the surface' do
        expect(subject).to be false
      end
    end

    context '0,-1' do
      let(:location) { Location.new(x: 0, y: -1) }
      it 'should return false if location is off the surface' do
        expect(subject).to be false
      end
    end
  end
end
