class LogsController < ApplicationController
  def index
    @logs = Log.all
    render :index
  end

  def create
    binding.pry
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
