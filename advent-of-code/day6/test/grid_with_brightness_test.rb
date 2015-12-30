require 'minitest/autorun'

require_relative '../grid_with_brightness'

describe GridWithBrightness do
  subject { GridWithBrightness.new }

  it "starts with all lights off" do
    subject.measure_brightness.must_equal 0
  end

  describe "#turn_on" do
    it "can turn on many lights" do
      subject.turn_on([0,0], [99,99])
      subject.measure_brightness.must_equal 10_000
    end

    it "increases the brightness by 1" do
      subject.turn_on([0,0], [0,0])
      subject.measure_brightness.must_equal 1
    end

    it "can turn on the middle four lights" do
      subject.turn_on([499, 499], [500, 500])
      subject.measure_brightness.must_equal 4
    end

    it "can turn on and then increase the brightness" do
      subject.turn_on([0,0], [0,0])
      subject.measure_brightness.must_equal 1

      subject.turn_on([0,0], [0,0])
      subject.measure_brightness.must_equal 2
    end
  end


  describe "#turn_off" do
    it "decreases the brightness by 1" do
      subject.turn_on([0,0], [0,0])
      subject.turn_on([0,0], [0,0])
      subject.measure_brightness.must_equal 2

      subject.turn_off([0,0], [0,0])
      subject.measure_brightness.must_equal 1
    end

    it "does not decrease the brightness below zero" do
      subject.turn_off([0,0], [0,0])
      subject.measure_brightness.must_equal 0
    end
  end

  describe "#toggle" do
    it "increases the brightness by 2" do
      subject.toggle([0,0], [0,0])
      subject.measure_brightness.must_equal 2
    end
  end
end
