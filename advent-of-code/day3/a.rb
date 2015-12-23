require_relative 'deliveries'

input = $stdin.read.chomp

deliveries = Deliveries.from_input(input)

puts "Ho ho ho! I delivered presents to #{deliveries.size} houses!"
