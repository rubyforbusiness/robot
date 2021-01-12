# frozen_string_literal: true

RSpec.describe Command do
  describe '#post_initialize' do
    subject do
      described_class.new.post_initialize
    end
    it 'should return nil' do
      expect(subject).to be nil
    end
  end

  describe '#execute' do
    subject { described_class.new.execute(nil) }
    it 'should raise an error since it is an abstract class' do
      expect { subject }.to raise_error(NotImplementedError)
    end
  end
end
