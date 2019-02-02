class CommandsController < ApplicationController
  def index
    @command = Command.last_one
    render :index, formats: 'json'
  end
end
