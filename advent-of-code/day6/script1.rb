require_relative 'grid_robot'

robot = GridRobot.new(GridWithoutBrightness)

ARGF.each_line do |input|
  input.chomp!
  robot.follow_instructions(input)
  puts input + ": there are now #{robot.count_lit_lights} lit lights"
end

puts "After following all instructions there are #{robot.count_lit_lights} lit lights."
