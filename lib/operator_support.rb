module OperatorSupport
  OPERATOR_TABLE = {
      :+ => {}, :- => {}, :* => {}, :/ => {}
  }

  def operator?(c)
    OPERATOR_TABLE.include?(c.to_sym)
  end
end