require 'spec_helper.rb'

describe Lex do
  subject(:lex) { Lex.new }

  describe '#tokenize' do
    it '1+1' do
      expect(lex.tokenize('1+1')).to eq [1, :+, 1]
    end

    it '2-1' do
      expect(lex.tokenize('2-1')).to eq [2, :-, 1]
    end
  end
end
