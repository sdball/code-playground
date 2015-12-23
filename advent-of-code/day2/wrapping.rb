#!/usr/bin/env ruby

class Wrapping
  def self.surface_area(dimensions)
    length, width, height = dimensions.split('x').map!(&:to_i)
    area(length, width, height) + slack(length, width, height)
  end

  def self.slack(length, width, height)
    [length, width, height].combination(2).map { |a,b| a * b }.min
  end

  def self.area(length, width, height)
    (2 * length * width) + (2 * width * height) + (2 * height * length)
  end
end

class Ribbon
  def self.length(dimensions)
    length, width, height = dimensions.split('x').map!(&:to_i)
    wrap(length, width, height) + bow(length, width, height)
  end

  def self.wrap(length, width, height)
    [length, width, height].min(2).map { |n| n + n }.inject(:+)
  end

  def self.bow(length, width, height)
    length * width * height
  end
end

total_wrapping = 0
total_ribbon = 0
$stdin.each_line do |dimensions|
  total_wrapping += Wrapping.surface_area(dimensions)
  total_ribbon += Ribbon.length(dimensions)
end

puts "We need a total of #{total_wrapping} square feet of wrapping paper."
puts "We need a total of #{total_ribbon} feet of ribbon."
