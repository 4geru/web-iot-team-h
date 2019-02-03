class LogHistoryController < ApplicationController
  def index
    @logs = Log.all.order(created_at: :desc).limit(20)
    @log_attributes = log_attributes
    @setting_logs = setting_logs
  end

  private

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
