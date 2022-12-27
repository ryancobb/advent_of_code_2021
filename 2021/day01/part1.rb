require 'csv'

readings = CSV.read('input.csv', converters: :numeric).flatten
count = 0

readings.each_with_index do |reading, index|
  next if readings[index + 1].nil?
  next unless reading < readings[index + 1]

  count += 1
end

puts "#{count} larger measurements"
