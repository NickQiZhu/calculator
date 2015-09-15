module OperationTable
  OPERATOR_TABLE = {
      :+ => 1, :- => 1, :* => 0, :/ => 0
  }

  def to_operator(c)
    c.to_s.to_sym
  end

  def operator?(c)
    OPERATOR_TABLE.include?(to_operator(c))
  end

  def operand?(token)
    !operator?(token)
  end

  def op_orders
    OPERATOR_TABLE.values.uniq.sort
  end

  def matching_order?(op_order, operator)
    OPERATOR_TABLE[operator] == op_order
  end
end