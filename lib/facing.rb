# frozen_string_literal: true

# Which way an entity it facing as per a compass
class Facing
  VALID_DIRECTIONS = %i[north south east west].freeze
  attr_reader :direction

  def initialize(direction)
    @direction = validate(direction&.to_sym)
  end

  private

  def validate(direction)
    raise ArgumentError unless VALID_DIRECTIONS.include? direction

    direction
  end
end
