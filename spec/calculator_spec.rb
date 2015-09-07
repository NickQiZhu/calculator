require 'spec_helper.rb'

describe Calculator do
  subject(:calc) { Calculator.new }

  describe '#calculate' do
    {
        '1 + 1' => 2
    }.each_pair do |expression, result|
      it "#{expression}" do
        expect(calc.calculate(expression)).to eq result
      end
    end


  end
end
