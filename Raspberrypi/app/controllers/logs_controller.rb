class LogsController < ApplicationController
  protect_from_forgery except: :create


  ACCESS_CONTROL_ALLOW_METHODS = %w(CREATE).freeze
  ACCESS_CONTROL_ALLOW_HEADERS = %w(Accept Origin Content-Type Authorization).freeze
  def index
    @logs = Log.all
    render :index
  end

  def create
    @log = Log.create(log_params)
    render :create, formats: 'json'
  end

  private 

  def log_params
    params.permit(%i[
      tanbo_id
      shitsudo
      oto
      ondo
      camera
      light
      loged_at
    ])
  end
end
