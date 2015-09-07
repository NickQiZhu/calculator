class Parser
  def parse(tokens)
    stack = []

    tokens.each do |token|
      if form_operation?(stack, token)
        operator = stack.pop
        left = stack.pop
        right = token
        stack.push [operator, left, right]
      else
        stack.push token
      end
    end

    stack.pop
  end

  private

  def form_operation?(stack, token)
    operand?(token) && !first_token?(stack)
  end

  def operator?(token)
    token.is_a?(Symbol)
  end

  def operand?(token)
    !operator?(token)
  end

  def first_token?(stack)
    stack.empty?
  end
end