class DashboardsController < ApplicationController
  def index

    @command_last_one = Command.last_one.empty? ? Command.new : Command.last_one
    @command_attributes = command_attributes
    @japanese_commands = japanese_commands

    @mizu_histories = Command.where(mizu: true).order(created_at: :desc).limit(30)


    @logs = Log.all.order(created_at: :desc).limit(50)
    @log_attributes = log_attributes
    @setting_logs = setting_logs

    @commands = Command.all[1..-1] || []
  end


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

  def log_attributes
    Log.new.attributes.keys - ['tanbo_id', 'id', 'created_at', 'updated_at', 'loged_at', 'camera']
  end

  def setting_logs
    { 
      'shitsudo': { jp: '湿度', color: '#209BEE', slice: 1, times: 1},
      'oto': { jp: '音', color: '#23D160', slice: 1, times: 10},
      'ondo': { jp: '温度', color: '#FF5656' , slice: 1, times: 1},
      'light': { jp: '光度', color: '#FFDD56' , slice: 100, times: 1}
    }
  end
end
