require 'csv'

def bits_to_i(bits)
  bits.join.to_i(2)
end

numbers = CSV.read('input.csv').flatten
bits_length = numbers.first.length
gamma_rate = []
epsilon_rate = []

bits_length.times do |i|
  zero_count = 0
  one_count = 0

  numbers.each do |number|
    case number[i].to_i
    when 0 then zero_count += 1
    when 1 then one_count += 1
    end
  end

  rates = if zero_count > one_count
            %w[0 1]
          else
            %w[1 0]
          end

  gamma_rate << rates[0]
  epsilon_rate << rates[1]
end

gamma = bits_to_i(gamma_rate)
epsilon = bits_to_i(epsilon_rate)

puts "gamma rate: #{gamma}"
puts "epsilon rate: #{epsilon}"
puts
puts "power consumption: #{gamma * epsilon}"
