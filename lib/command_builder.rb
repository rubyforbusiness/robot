# frozen_string_literal: true

require 'place_command'
# creates different types of Commands
class CommandBuilder
  attr_reader :surface

  COMMAND_MAPPER = {
    'PLACE' => lambda { |args, surface|
      PlaceCommand.new(split_place_args(args).merge(surface: surface))
    },
    'MOVE' => lambda { |_args, surface|
      MoveCommand.new(surface: surface)
    },
    'LEFT' => lambda { |_args, _surface|
      LeftCommand.new
    },
    'RIGHT' => lambda { |_args, _surface|
      RightCommand.new
    },
    'REPORT' => lambda { |_args, _surface|
      ReportCommand.new
    }
  }.freeze

  def initialize(surface = nil)
    @surface = surface
  end

  def build(raw_command)
    name, args = raw_command.split
    COMMAND_MAPPER[name].call(args, surface)
  end

  def self.split_place_args(args)
    arg_array = args.split ','
    {
      x: arg_array[0],
      y: arg_array[1],
      f: arg_array[2]&.downcase&.to_sym
    }
  end
end
