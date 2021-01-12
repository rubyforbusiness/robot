# frozen_string_literal: true

RSpec.describe Facing do
  let(:args) { :north }
  subject { Facing.new(args) }
  describe '#direction' do
    context 'valid args' do
      it 'should be initialized properly' do
        expect(subject.direction).to eq args
      end
    end
    context 'invalid args' do
      context 'nil argument' do
        let(:args) { nil }
        it 'should raise an error' do
          expect { subject }.to raise_error(ArgumentError)
        end
      end
      context 'rubbish argument' do
        let(:args) { 'rubbish' }
        it 'should raise an error' do
          expect { subject }.to raise_error(ArgumentError)
        end
      end
    end
  end

  describe 'immutability' do
    it 'should not be changeable by usual methods' do
      expect(subject).not_to respond_to(:direction=)
    end
  end
end
