#!/usr/bin/env ruby -I./lib

# Args: console | file containing commands for the robot

require 'right_command'
require 'left_command'
require 'report_command'
require 'move_command'
require 'facing'
require 'location'
require 'place_command'
require 'surface'
require 'robot'
require 'command_builder'

surface = Surface.new(x: 5, y:5)
robot = Robot.new
command_builder = CommandBuilder.new(surface)

found_place = false
ARGF.each_line do |line|
  unless found_place
    next unless line =~ /^PLACE/
    found_place = true
  end
  command = command_builder.build(line)
  robot.execute command
end

