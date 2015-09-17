require_relative 'operations'

class Lex
  include Operations

  def tokenize(string)
    tokens = []
    token = reset_token

    string.each_char do |c|
      if operator?(c) || parenthesis?(c)
        append_number(tokens, token)
        append_symbol(tokens, c)
        token = reset_token
      else
        token << c
      end
    end

    append_number(tokens, token)
  end


  private

  def parenthesis?(c)
    %w{( )}.include?(c)
  end

  def reset_token
    ''
  end

  def append_number(tokens, token)
    tokens << token.to_f unless token.empty?
    tokens
  end

  def append_symbol(tokens, token)
    tokens << to_symbol(token)
    tokens
  end

end