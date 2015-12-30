require 'set'
require_relative 'grid'

class GridWithoutBrightness < Grid
  attr_reader :lit

  def initialize
    @lit = Set.new
  end

  def count_lit_lights
    lit.size
  end

  def turn_on(upper_left, lower_right)
    walk(upper_left, lower_right) { |point| lit << point }
  end

  def turn_off(upper_left, lower_right)
    walk(upper_left, lower_right) { |point| lit.delete point }
  end

  def toggle(upper_left, lower_right)
    walk(upper_left, lower_right) do |point|
      if lit.include? point
        lit.delete point
      else
        lit << point
      end
    end
  end
end
