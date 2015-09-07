require_relative 'lex'
require_relative 'parser'

class Calculator
  OPERATIONS = {
      :+ => ->(l, r) { l + r },
      :- => ->(l, r) { l - r },
      :* => ->(l, r) { l * r },
      :/ => ->(l, r) { l / r }
  }

  def initialize
    @lex = Lex.new
    @parser = Parser.new
  end

  def calculate(exp)
    evaluate(@parser.parse(@lex.tokenize(exp)))
  end

  private

  def evaluate(node)
    if operation?(node)
      evaluate_operation(node)
    else
      evaluate_literal(node)
    end
  end

  def evaluate_operation(node)
    operator = node[0]
    left = node[1]
    right = node[2]

    find_op_func(operator).call(evaluate(left), evaluate(right))
  end

  def evaluate_literal(node)
    node
  end

  def operation?(node)
    node.is_a?(Array)
  end

  def find_op_func(operator)
    OPERATIONS[operator]
  end

end