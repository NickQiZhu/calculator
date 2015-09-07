require_relative 'lex'
require_relative 'parser'

class Calculator
  OPERATIONS = {:+ => ->(l, r) { l + r }}

  def initialize
    @lex = Lex.new
    @parser = Parser.new
  end

  def calculate(exp)
    ast = @parser.parse(@lex.tokenize(exp))

    evaluate(ast)
  end

  def evaluate(ast)
    operator = ast[0]
    left = ast[1]
    right = ast[2]

    OPERATIONS[operator].call(left, right)
  end
end