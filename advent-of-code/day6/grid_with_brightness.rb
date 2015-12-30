require 'set'

class GridWithBrightness
  attr_reader :lit

  def initialize
    @lit = Hash.new(0)
  end

  def input(string)
    command, upper_left, lower_right = parse_input(string)
    self.send(command, upper_left, lower_right)
  end

  def measure_brightness
    return 0 if lit.size.zero?
    lit.values.inject(:+)
  end

  # increase brightness by 1
  def turn_on(upper_left, lower_right)
    walk(upper_left, lower_right) do |point|
      lit[point] += 1
    end
  end

  # decrease brightness by 1 to a minimum of 0
  def turn_off(upper_left, lower_right)
    walk(upper_left, lower_right) do |point|
      next if lit[point].zero?
      lit[point] -= 1
    end
  end

  # increase brightness by 2
  def toggle(upper_left, lower_right)
    walk(upper_left, lower_right) do |point|
      lit[point] += 2
    end
  end

  # the lights at each corner are at 0,0, 0,999, 999,999, and 999,0
  def walk(upper_left, lower_right)
    x1, x2 = [upper_left.first, lower_right.first]
    y1, y2 = [upper_left.last, lower_right.last]

    y1.upto(y2) do |y|
      x1.upto(x2) do |x|
        yield [x, y]
      end
    end
  end
end
