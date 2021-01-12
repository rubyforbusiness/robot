# frozen_string_literal: true

require 'command'

# Concrete class for RIGHT commands
class RightCommand < Command
  FACING_TRANSITIONS = {
    north: :east,
    west: :north,
    east: :south,
    south: :west
  }.freeze

  def execute(obj)
    obj.facing = Facing.new(FACING_TRANSITIONS[obj.facing.direction])
  end
end
