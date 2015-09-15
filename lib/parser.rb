require_relative 'operations'

class Parser
  include Operations

  def parse(tokens)
    stack = tokens

    op_orders.each do |op_order|
      stack = parse_in_order(stack, op_order)
    end

    stack.pop
  end

  def parse_in_order(tokens, op_order)
    stack = []

    tokens.each do |token|
      if operation_available?(stack, token)
        handle_operation(op_order, stack, token)
      else
        stack.push token
      end
    end

    stack
  end

  private

  def operation_available?(stack, token)
    operand?(token) && !first_token?(stack)
  end

  def first_token?(stack)
    stack.empty?
  end

  def handle_operation(op_order, stack, token)
    operator = stack.pop
    if matching_order?(op_order, operator)
      form_operation(operator, stack, token)
    else
      skip_operation(operator, stack, token)
    end
  end

  def form_operation(operator, stack, token)
    left = stack.pop
    right = token
    stack.push [operator, left, right]
  end

  def skip_operation(operator, stack, token)
    stack.push operator
    stack.push token
  end

end