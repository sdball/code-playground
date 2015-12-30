class ParseGridInput
  def self.call(input)
    command = case(input)
              when /turn on/
                :turn_on
              when /turn off/
                :turn_off
              when /toggle/
                :toggle
              else
                raise ArgumentError, "Invalid input!"
              end
    range = input.scan(/\d+,\d+/).map { |point| point.split(',').map! { |i| i.to_i } }
    [command, *range]
  end
end

