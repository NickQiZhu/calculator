require 'spec_helper.rb'

describe Parser do
  subject(:parser) { Parser.new }

  describe '#parse' do
    [
        [ [1, :+, 2], [:+, 1, 2] ],
        [ [2, :-, 1, :+, 3], [:+, [:-, 2, 1], 3] ],
        [ [2, :-, 1, :*, 3], [:-, 2, [:*, 1, 3]] ],
        [ [:'(', 1, :+, 2, :')'], [:+, 1, 2] ],
        [ [2, :*, :'(', 1, :+, 2, :')'], [:*, 2, [:+, 1, 2]] ],
        [ [2, :*, :'(', :'(', 1, :+, 2, :')', :*, 1, :')'], [:*, 2, [:*, [:+, 1, 2], 1]] ],
    ].each do |test|
      it "#{test.first.join(' ')}" do
        expect(parser.parse(test.first)).to eq test.last
      end
    end


  end
end
