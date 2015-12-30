require 'minitest/autorun'

require_relative '../grid_robot'

describe GridRobot do
  subject { GridRobot.new }

  it "applies text instructions to a grid" do
    subject.follow_instructions("toggle 0,0 through 999,0")
    subject.count_lit_lights.must_equal 1000
  end

  it "works against a persistent grid" do
    subject.follow_instructions("toggle 0,0 through 999,0")
    subject.follow_instructions("toggle 0,0 through 499,0")
    subject.count_lit_lights.must_equal 500
  end
end
