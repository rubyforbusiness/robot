# frozen_string_literal: true

RSpec.describe PlaceCommand do
  let(:surface) { Surface.new(x: 5, y: 5) }
  let(:new_direction) { :north }
  let(:args) { { x: 1, y: 2, f: new_direction, surface: surface } }
  let(:new_position) { [1, 2] }
  describe '#initialize' do
    subject do
      described_class.new(args)
    end
    it 'should create correct state' do
      expect(subject.x).to eq 1
      expect(subject.y).to eq 2
      expect(subject.f).to eq new_direction
    end
  end

  describe '#execute' do
    # TODO: reduce coupling by using a double instead of Robot
    subject do
      described_class.new(args).execute(obj)
    end
    let(:obj) { Robot.new }
    context 'valid placing' do
      it 'should change the location of the supplied object' do
        expect do
          subject
        end.to change { obj.location&.position }.to(new_position)
      end
      it 'should change the direction of the supplied object' do
        expect do
          subject
        end.to change { obj.facing&.direction }.to(new_direction)
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

      context 'invalid facing' do
        subject do
          described_class.new(args).execute(obj)
        end
        let(:args) { { x: 1, y: 2, f: :rubbish, surface: surface } }
        it 'raise an error' do
          expect { described_class.new(args).execute(obj) }.to raise_error(ArgumentError)
        end
      end
    end
  end
end
