require_relative 'deliveries'

require "minitest/autorun"

describe Deliveries do
  describe ".from_input" do
    it "records one delivery with no input" do
      Deliveries.from_input("").size.must_equal 1
    end

    it "records two deliveries from one command" do
      Deliveries.from_input("^").size.must_equal 2
    end

    it "records three deliveries from ^^" do
      Deliveries.from_input("^^").size.must_equal 3
    end

    it "records two deliveries from ^v^v^v" do
      Deliveries.from_input("^v^v^v").size.must_equal 2
    end
  end
end

describe TransformInput do
  describe ".to_points" do
    it "transforms ^" do
      TransformInput.to_points('^').must_equal [ [0,+1] ]
    end

    it "transforms v" do
      TransformInput.to_points('v').must_equal [ [0,-1] ]
    end

    it "transforms <" do
      TransformInput.to_points('<').must_equal [ [-1,0] ]
    end

    it "transforms >" do
      TransformInput.to_points('>').must_equal [ [+1,0] ]
    end

    it "transforms >>" do
      TransformInput.to_points(">>").must_equal [
        [1,0],
        [1,0],
      ]
    end
  end
end
