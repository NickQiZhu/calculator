require_relative 'operations'

class Lex
  include Operations

  def tokenize(string)
    tokens = []
    token = new_token

    string.each_char do |c|
      if operator?(c)
        tokens << to_number(token)
        tokens << to_operator(c)
        token = new_token
      else
        token << c
      end
    end

    tokens << to_number(token)
  end

  private

  def new_token
    ''
  end

  def to_number(token)
    token.to_f
  end

end