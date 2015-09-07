require 'spec_helper.rb'

describe Lex do
  subject(:lex) { Lex.new }

  describe '#tokenize' do
    {
        '1+1' => [1, :+, 1],
        '20 - 11' => [20, :-, 11],
        '1.11 * 11.22 / 1.333' => [1.11, :*, 11.22, :/, 1.333]
    }.each_pair do |e, t|
      it(e) { expect(lex.tokenize(e)).to eq t }
    end


  end
end
