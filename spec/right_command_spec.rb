# frozen_string_literal: true

RSpec.describe RightCommand do
  describe '#execute' do
    subject do
      described_class.new.execute(obj)
    end

    context 'RIGHT from north' do
      let(:old_facing) { Facing.new(:north) }
      let(:obj) { Robot.new(nil, old_facing) }
      let(:new_direction) { :east }
      it 'should change the direction of the supplied object' do
        expect do
          subject
        end.to change { obj.facing&.direction }.from(old_facing.direction).to(new_direction)
      end
    end

    context 'RIGHT from west' do
      let(:old_facing) { Facing.new(:west) }
      let(:obj) { Robot.new(nil, old_facing) }
      let(:new_direction) { :north }
      it 'should change the direction of the supplied object' do
        expect do
          subject
        end.to change { obj.facing&.direction }.from(old_facing.direction).to(new_direction)
      end
    end

    context 'RIGHT from south' do
      let(:old_facing) { Facing.new(:south) }
      let(:obj) { Robot.new(nil, old_facing) }
      let(:new_direction) { :west }
      it 'should change the direction of the supplied object' do
        expect do
          subject
        end.to change { obj.facing&.direction }.from(old_facing.direction).to(new_direction)
      end
    end

    context 'RIGHT from east' do
      let(:old_facing) { Facing.new(:east) }
      let(:obj) { Robot.new(nil, old_facing) }
      let(:new_direction) { :south }
      it 'should change the direction of the supplied object' do
        expect do
          subject
        end.to change { obj.facing&.direction }.from(old_facing.direction).to(new_direction)
      end
    end
  end
end
