require "minitest/autorun"

require_relative "../parse_grid_input"

describe ParseGridInput do
  it "splits the input into command and range" do
    ParseGridInput.call("turn on 0,0 through 999,999").must_equal [:turn_on, [0,0], [999,999]]
  end

  it "rejects invalid input" do
    proc {
      ParseGridInput.call("xyzzy")
    }.must_raise ArgumentError
  end
end
