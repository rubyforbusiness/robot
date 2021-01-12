# frozen_string_literal: true

require 'command'

# Concrete class for LEFT commands
class LeftCommand < Command
  FACING_TRANSITIONS = {
    north: :west,
    west: :south,
    east: :north,
    south: :east
  }.freeze

  def execute(obj)
    obj.facing = Facing.new(FACING_TRANSITIONS[obj.facing.direction])
  end
end
