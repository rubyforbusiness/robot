# frozen_string_literal: true

# Locations on a grid
class Location
  attr_reader :x, :y

  def initialize(args = {})
    @x = args[:x]
    @y = args[:y]
  end

  def position
    [x, y]
  end
end
