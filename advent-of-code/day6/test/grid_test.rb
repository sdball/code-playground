require "minitest/autorun"

require_relative "../grid"

describe Grid do
  subject { Grid.new }

  describe "#walk" do
    it "returns a single point if the range is 1" do
      points = []
      subject.walk([0,0], [0,0]) { |point| points << point }
      points.must_equal [[0,0]]
    end

    it "returns the four middle points in a grid of 1000x1000" do
      points = []
      subject.walk([499,499], [500,500]) { |point| points << point }
      points.must_equal [[499,499], [500,499], [499,500], [500,500]]
    end

    it "returns a million points for a grid of 1000x1000" do
      count = 0
      subject.walk([0,0], [999,999]) { |point| count += 1 }
      count.must_equal 1_000_000
    end
  end
end

