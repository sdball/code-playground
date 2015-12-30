require_relative 'grids'
require_relative 'parse_grid_input'

class GridRobot
  attr_reader :grid

  def initialize(grid=GridWithoutBrightness)
    @grid = grid.new
  end

  def follow_instructions(input)
    command, upper_left, lower_right = ParseGridInput.call(input)
    grid.send(command, upper_left, lower_right)
  end

  def count_lit_lights
    grid.count_lit_lights
  end

  def measure_brightness
    grid.measure_brightness
  end
end
