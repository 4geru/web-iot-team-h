class CommandsController < ApplicationController
  before_action :allow_origin
  def index
    @command = Command.last_one
    render :index, formats: 'json'
  end

  def allow_origin
    headers['Access-Control-Allow-Origin'] = '*'
  end
end
