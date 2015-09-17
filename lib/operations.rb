module Operations
  class OpDef < Struct.new(:order, :func)
  end

  def to_symbol(c)
    c.to_s.to_sym
  end

  def operator?(c)
    operations.include?(to_symbol(c))
  end

  def operand?(token)
    !operator?(token)
  end

  def op_orders
    operation_orders.uniq.sort
  end

  def matching_order?(op_order, operator)
    op = find_operation(operator)
    if op
      op_order == op.order
    else
      false
    end
  end

  def find_op_func(operator)
    find_operation(operator).func
  end

  private

  def find_operation(operator)
    operations[operator]
  end

  def operation_orders
    operations.values.map { |v| v.order }
  end

  def operations
    @operations ||= {
        :+ => OpDef.new(1, ->(l, r) { l + r }),
        :- => OpDef.new(1, ->(l, r) { l - r }),
        :* => OpDef.new(0, ->(l, r) { l * r }),
        :/ => OpDef.new(0, ->(l, r) { l / r })
    }
  end
end