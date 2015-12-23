require_relative 'deliveries'

input = $stdin.read.chomp.split("")
santa = input.each_index.select { |i| i % 2 == 0 }.map { |i| input[i] }.join
robo_santa = input.each_index.select { |i| i % 2 != 0 }.map { |i| input[i] }.join

santa_deliveries = Deliveries.from_input(santa)
robo_santa_deliveries = Deliveries.from_input(robo_santa)

deliveries = santa_deliveries.merge robo_santa_deliveries

puts "Ho ho ho! We delivered presents to #{deliveries.size} houses!"
