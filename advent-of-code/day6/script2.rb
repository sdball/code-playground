require_relative 'grid_robot'

robot = GridRobot.new(GridWithBrightness)

ARGF.each_line do |input|
  input.chomp!
  robot.follow_instructions(input)
  puts input + " : done!"
end

puts "After following all instructions the brightness is #{robot.measure_brightness}."
