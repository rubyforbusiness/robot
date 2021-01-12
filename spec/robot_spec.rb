# frozen_string_literal: true

RSpec.describe Robot do
  describe '#initialize' do
    context 'with no arguments' do
      subject do
        Robot.new
      end
      it 'should have nil attributes' do
        expect(subject.location).to eq nil
        expect(subject.facing).to eq nil
      end
    end

    context 'with arguments' do
      let(:location) { Location.new(x: 1, y: 2) }
      let(:facing) { Facing.new(:south) }

      context 'with location' do
        subject do
          Robot.new(location)
        end
        it 'should have a valid location and nil facing' do
          expect(subject.location).to eq location
          expect(subject.facing).to eq nil
        end
      end

      context 'with facing' do
        subject do
          Robot.new(nil, facing)
        end
        it 'should have a valid facing and nil location' do
          expect(subject.facing).to eq facing
          expect(subject.location).to eq nil
        end
      end
      context 'with both location and facing' do
        subject do
          Robot.new(location, facing)
        end
        it 'should have a valid facing and location' do
          expect(subject.facing).to eq facing
          expect(subject.location).to eq location
        end
      end
    end
  end

  describe '#execute' do
    context 'PLACE command' do
      let(:surface) { Surface.new(x: 5, y: 5) }
      let(:new_location) { Location.new(x: 1, y: 2) }
      let(:new_facing) { Facing.new(:north) }
      let(:command) { CommandBuilder.new(surface).build('PLACE 1,2,NORTH') }
      subject do
        described_class.new.execute(command)
      end
      it 'should set the location of the robot' do
        expect(subject.location.position).to eq new_location.position
      end
      it 'should set the direction of the robot' do
        expect(subject.facing.direction).to eq new_facing.direction
      end
    end

    context 'LEFT command' do
      let(:new_facing) { Facing.new(:north) }
      let(:command) { CommandBuilder.new.build('LEFT') }
      subject do
        described_class.new(nil, Facing.new(:east)).execute(command)
      end
      it 'should set the direction of the robot' do
        expect(subject.facing.direction).to eq new_facing.direction
      end
    end

    context 'RIGHT command' do
      let(:new_facing) { Facing.new(:north) }
      let(:command) { CommandBuilder.new.build('RIGHT') }
      subject do
        described_class.new(nil, Facing.new(:west)).execute(command)
      end
      it 'should set the direction of the robot' do
        expect(subject.facing.direction).to eq new_facing.direction
      end
    end

    context 'REPORT command' do
      let(:facing) { Facing.new(:south) }
      let(:location) { Location.new(x: 3, y:4) }
      let(:command) { CommandBuilder.new.build('REPORT') }
      subject do
        described_class.new(location, facing).execute(command)
      end
      it 'should report the location and direction of the robot' do
        expect { subject }.to output("3,4,SOUTH\n").to_stdout
      end
    end
  end
end
