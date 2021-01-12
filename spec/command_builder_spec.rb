# frozen_string_literal: true

RSpec.describe CommandBuilder do
  let(:surface) { Surface.new(x: 5, y: 5) }
  describe '#initialize' do
    subject do
      described_class.new(surface)
    end
    it 'should set a surface' do
      expect(subject.surface).not_to be nil
    end
  end

  describe '#build' do
    context 'PlaceCommand' do
      let(:args) { 'PLACE 1,2,NORTH' }
      subject do
        described_class.new(surface).build(args)
      end
      it 'should create a PlaceCommand' do
        expect(subject).to be_a_kind_of(PlaceCommand)
      end
    end

    context 'MoveCommand' do
      let(:args) { 'MOVE' }
      subject do
        described_class.new(surface).build(args)
      end
      it 'should create a MoveCommand' do
        expect(subject).to be_a_kind_of(MoveCommand)
      end
    end

    context 'LeftCommand' do
      let(:args) { 'LEFT' }
      subject do
        described_class.new(surface).build(args)
      end
      it 'should create a LeftCommand' do
        expect(subject).to be_a_kind_of(LeftCommand)
      end
    end

    context 'RightCommand' do
      let(:args) { 'RIGHT' }
      subject do
        described_class.new(surface).build(args)
      end
      it 'should create a RightCommand' do
        expect(subject).to be_a_kind_of(RightCommand)
      end
    end

    context 'ReportCommand' do
      let(:args) { 'REPORT' }
      subject do
        described_class.new(surface).build(args)
      end
      it 'should create a ReportCommand' do
        expect(subject).to be_a_kind_of(ReportCommand)
      end
    end
  end
end
