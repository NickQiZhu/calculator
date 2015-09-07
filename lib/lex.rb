class Lex
  OPERATORS = %w(+ - * /)

  def tokenize(string)
    tokens = []
    token = ''

    string.each_char do |c|
      if operator?(c)
        tokens << to_number(token)
        tokens << to_operator(c)
        token = ''
      else
        token << c
      end
    end

    tokens << to_number(token)
  end

  private

  def to_number(token)
    token.to_f
  end

  def to_operator(c)
    c.to_sym
  end

  def operator?(c)
    OPERATORS.include? c
  end
end