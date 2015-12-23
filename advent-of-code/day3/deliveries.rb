require "set"

class Deliveries
  def self.from_input(input)
    deliveries = Set.new
    current_location = first_delivery
    deliveries << current_location

    TransformInput.to_points(input).each do |move|
      current_location = current_location.zip(move).map { |a,b| a + b }
      deliveries << current_location
    end

    deliveries
  end

  def self.first_delivery
    [0,0]
  end
end

class TransformInput
  def self.to_points(input)
    input.split("").map { |s| to_point(s) }
  end

  def self.to_point(character)
    case character
    when '^'
      [0,+1]
    when 'v'
      [0,-1]
    when '<'
      [-1,0]
    when '>'
      [+1,0]
    else
      raise "Cannot convert #{character} to point."
    end
  end
end
