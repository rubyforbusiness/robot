# frozen_string_literal: true

# Toy Robot
class Robot
  attr_accessor :location, :facing

  def initialize(location = nil, facing = nil)
    @location = location
    @facing = facing
  end

  def execute(command)
    command.execute(self)
    self
  end
end
