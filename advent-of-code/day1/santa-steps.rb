#!/usr/bin/env ruby

class Santa
  def self.what_floor?(instructions)
    instructions.split('').map! { |character| character == '(' ? 1 : -1 }.inject(:+)
  end

  def self.which_step_reaches_the_basement_first?(instructions)
    0.upto(instructions.length) do |n|
      floor = what_floor? (instructions.slice(0,n))
      return n if floor == -1
    end
  end
end

instructions = $stdin.read
instructions.chomp!

floor = Santa.what_floor? instructions
puts "Ho ho ho! I'm on floor #{floor}"

basement_step = Santa.which_step_reaches_the_basement_first? instructions
if basement_step
  puts "Ho ho ho! I first entered the basement on step #{basement_step}"
else
  puts "Ho ho ho! I never entered the basement!"
end

