# frozen_string_literal: true

require 'command'

# Concrete class for MOVE commands
class MoveCommand < Command
  attr_reader :surface

  MOVEMENT_DELTAS = {
    north: [0, 1],
    west: [-1, 0],
    east: [1, 0],
    south: [0, -1]
  }.freeze

  def initialize(args)
    @surface = args[:surface]
  end

  def execute(obj)
    new_position = obj.location.position.map.with_index do |pos, index|
      pos + MOVEMENT_DELTAS
            .fetch(obj.facing&.direction)
            &.at(index)
    end

    location = Location.new(x: new_position[0], y: new_position[1])
    return unless surface.valid_location?(location)

    obj.location = location
  end
end
