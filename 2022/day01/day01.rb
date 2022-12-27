require 'csv'
require 'debug'

elves = []
elf_index = 0

CSV.foreach('input.csv') do |line|
  next elf_index += 1 if line.empty?

  elves[elf_index] ||= []
  elves[elf_index] << line.first.chomp.to_i
end

puts elves.map(&:sum).max(3).sum
