# frozen_string_literal: true

RSpec.describe ReportCommand do
  describe '#execute' do
    subject do
      described_class.new.execute(obj)
    end

    let(:location) { Location.new(x: 1, y: 2) }
    let(:facing) { Facing.new(:north) }
    let(:obj) { Robot.new(location, facing) }
    it 'print x,y,direction' do
      expect { subject }.to output("1,2,NORTH\n").to_stdout
    end
  end
end
