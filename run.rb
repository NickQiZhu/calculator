require_relative 'lib/calculator'

calc = Calculator.new

puts 'Enter expression to start:'

while true do
  input = gets

  break if input.include? 'exit'

  puts "= #{calc.calculate(input)}"
end