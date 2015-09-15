module Operations
  OPERATIONS = {
      :+ => {order: 1, func: ->(l, r) { l + r }},
      :- => {order: 1, func: ->(l, r) { l - r }},
      :* => {order: 0, func: ->(l, r) { l * r }},
      :/ => {order: 0, func: ->(l, r) { l / r }}
  }

  def to_operator(c)
    c.to_s.to_sym
  end

  def operator?(c)
    OPERATIONS.include?(to_operator(c))
  end

  def operand?(token)
    !operator?(token)
  end

  def op_orders
    operation_orders.uniq.sort
  end

  def matching_order?(op_order, operator)
    op_order == find_operation(operator)[:order]
  end

  def find_op_func(operator)
    find_operation(operator)[:func]
  end

  private

  def find_operation(operator)
    OPERATIONS[operator]
  end

  def operation_orders
    OPERATIONS.values.map { |v| v[:order] }
  end
end