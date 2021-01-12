# frozen_string_literal: true

require 'command'

# Concrete class for PLACE commands
class PlaceCommand < Command
  attr_reader :x, :y, :f, :surface

  def post_initialize(args)
    @x = args[:x].to_i
    @y = args[:y].to_i
    @f = args[:f]
    @surface = args[:surface]
  end

  def execute(obj)
    location = Location.new(x: x, y: y)
    return unless surface.valid_location?(location)

    obj.location = location
    obj.facing = Facing.new(f)
  end
end
