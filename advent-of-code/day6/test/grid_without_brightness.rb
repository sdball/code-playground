require "minitest/autorun"

require_relative "../grid_without_brightness"

describe GridWithoutBrightness do
  subject { GridWithoutBrightness.new }

  it "starts with all lights off" do
    subject.count_lit_lights.must_equal 0
  end

  it "can turn on many lights" do
    subject.turn_on([0,0], [99,99])
    subject.count_lit_lights.must_equal 10_000
  end

  it "can turn on the four middle lights" do
    subject.turn_on([499, 499], [500, 500])
    subject.count_lit_lights.must_equal 4
  end

  it "can turn the four middle lights on and off" do
    subject.turn_on([499,499], [500, 500])
    subject.turn_off([499,499], [500, 500])
    subject.count_lit_lights.must_equal 0
  end

  it "can turn on the first row of 1000 lights" do
    subject.turn_on([0,0], [999,0])
    subject.count_lit_lights.must_equal 1000
  end

  it "can toggle lights from on to off" do
    subject.toggle([0,0], [499,0])
    subject.count_lit_lights.must_equal 500

    subject.toggle([0,0], [499,0])
    subject.count_lit_lights.must_equal 0
  end

  it "correctly walks a typical grid" do
    subject.turn_on([10,100], [49,149])
    subject.count_lit_lights.must_equal 2000
  end
end
