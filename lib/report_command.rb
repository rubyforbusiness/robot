# frozen_string_literal: true

require 'command'

# Concrete class for REPORT commands
class ReportCommand < Command
  def execute(obj)
    puts format('%<x>d,%<y>d,%<direction>s', x: obj&.location&.x,
                                             y: obj&.location&.y,
                                             direction: obj&.facing&.direction
                                                        &.to_s&.upcase)
  end
end
