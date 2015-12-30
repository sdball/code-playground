require 'set'

class Grid
  def input(string)
    command, upper_left, lower_right = parse_input(string)
    self.send(command, upper_left, lower_right)
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
