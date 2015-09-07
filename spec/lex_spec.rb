require 'spec_helper.rb'

describe Lex do
  subject(:lex) { Lex.new }

  describe '#tokenize' do
    {
        '1+1' => [1, :+, 1],
        '2-1' => [2, :-, 1]
    }.each_pair do |e, t|
      it(e) { expect(lex.tokenize(e)).to eq t }
    end


  end
end
