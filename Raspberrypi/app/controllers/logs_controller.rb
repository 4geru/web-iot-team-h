class LogsController < ApplicationController
  protect_from_forgery except: :create
  before_action :allow_origin

  def index
    @logs = Log.all.limit(50)
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

  def allow_origin
    headers['Access-Control-Allow-Origin'] = '*'
  end
end
