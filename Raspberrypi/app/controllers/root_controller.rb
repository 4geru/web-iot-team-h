class RootController < ApplicationController
  def index
    @command = Command.last_one
    @command_attributes = command_attributes
    @japanese_commands = japanese_commands
  end

  private

  def command_attributes
    Command.new.attributes.keys - ['id', 'created_at', 'updated_at']
  end

  def japanese_commands
    { 
      'mizu': '散水',
      'red_led': '赤LED',
      'green_led': '緑LED',
      'blue_led': '青LED'
    }
  end

  def japanese_logs
    { 
      'mizu': '散水',
      'red_led': '赤LED',
      'green_led': '緑LED',
      'blue_led': '青LED'
    }
  end
end
