# frozen_string_literal: true

# Abstract class for hooking in contract commands
class Command
  def initialize(args = {})
    post_initialize(args)
  end

  def post_initialize(_args = {})
    nil
  end

  def execute(_obj)
    raise NotImplementedError
  end
end
