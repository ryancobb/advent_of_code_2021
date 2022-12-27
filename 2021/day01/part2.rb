require 'csv'

WINDOW_SIZE = 3

readings = CSV.read('input.csv', converters: :numeric).flatten
count = 0
window_sums = []

readings.each_index do |index|
  window = readings[index..(index + WINDOW_SIZE - 1)]
  next if window.length < WINDOW_SIZE

  window_sums << window.sum
end

window_sums.each_with_index do |reading, index|
  next if window_sums[index + 1].nil?
  next unless reading < window_sums[index + 1]

  count += 1
end

puts "#{count} larger measurements"
