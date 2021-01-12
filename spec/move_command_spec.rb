# frozen_string_literal: true

RSpec.describe MoveCommand do
  let(:surface) { Surface.new(x: 5, y: 5) }
  let(:args) { { surface: surface } }
  describe '#initialize' do
    subject do
      described_class.new(args)
    end
    it 'should create correct state' do
      expect(subject.surface).to eq surface
    end
  end

  describe '#execute' do
    let(:new_position) { [0, 2] }
    let(:location) { Location.new(x: 1, y: 2) }
    let(:facing) { Facing.new(:west) }

    subject do
      described_class.new(args).execute(obj)
    end

    let(:obj) { Robot.new(location, facing) }
    context 'valid move' do
      it 'should change the location of the supplied object' do
        expect do
          subject
        end.to change { obj.location&.position }.to(new_position)
      end
    end

    context 'invalid placing' do
      context 'invalid location' do
        let(:surface) { Surface.new(x: 1, y: 1) }
        it 'ignores command when attempting to go off the surface' do
          expect do
            subject
          end.not_to change { obj.location }
          expect { subject }.not_to change { obj.facing }
        end
      end
    end
  end
end
