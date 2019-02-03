class LogHistoryController < ApplicationController
  def index
    @logs = Log.all.limit(50)
    @log_attributes = log_attributes
    @setting_logs = setting_logs
  end

  private

  def log_attributes
    Log.new.attributes.keys - ['tanbo_id', 'id', 'created_at', 'updated_at', 'loged_at', 'camera', 'light', 'oto']
  end

  def setting_logs
    { 
      'shitsudo': { jp: '湿度', color: '#209BEE'},
      # 'oto': { jp: '音' },
      'ondo': { jp: '温度', color: '#FF5656' },
      # 'light': { jp: '光度' }
    }
  end
end
