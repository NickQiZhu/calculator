require 'spec_helper.rb'

describe Calculator do
  subject(:calc) { Calculator.new }

  describe '#calculate' do
    {
        '1 + 1' => 2,
        '2 - 1.1' => 0.9,
        '2 - 1 * 3 + 2 / 2 + 5' => 5,
        '(1+1)' => 2,
        '2*(1+1)' => 4,
        '(2*((1+1)*4))' => 16,
    }.each_pair do |expression, result|
      it "#{expression}" do
        expect(calc.calculate(expression)).to be_within(0.1).of result
      end
    end


  end
end
