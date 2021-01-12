# frozen_string_literal: true

# Surface the robot is on e.g. a table
class Surface
  attr_reader :x, :y

  def initialize(args = {})
    @x = args[:x]
    @y = args[:y]
  end

  def valid_location?(location)
    (0..x).include?(location.x) && (0..y).include?(location.y)
  end
end
