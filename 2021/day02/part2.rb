require 'csv'

class Submarine
  attr_reader :x, :y

  def initialize
    @x = 0
    @y = 0
    @aim = 0
  end

  def move(command)
    direction = command[0]
    amount = command[1]

    case direction
    when 'forward'
      @x += amount
      @y += (@aim * amount)
    when 'down' then @aim += amount
    when 'up' then @aim -= amount
    end
  end
end

commands = CSV.read('input.csv', converters: :numeric, col_sep: ' ')
sub = Submarine.new

commands.each do |command|
  sub.move(command)
end

puts "horizontal position x final depth: #{sub.x * sub.y}"
