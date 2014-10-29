require_relative './spec_helper'
require_relative '../my_math_module'

describe MyMathModule do
  describe '#abs' do
    describe 'with negative input' do
      it 'should return a positive number' do
        actual = MyMathModule.abs -4

        expect(actual).to satisfy { |v| v > 0 }
      end
    end
    
    describe 'with a zero as input' do
      it 'should return a zero' do
        actual = MyMathModule.abs 0
        
        expect(actual).to eq 0
      end
    end

    describe 'with positive input' do
      it 'should return a positive number' do
        actual = MyMathModule.abs 4

        expect(actual).to satisfy { |v| v > 0 }
      end
    end
  end
end
