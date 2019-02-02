class RootController < ApplicationController
  def index
    @command = Command.last_one
    @log = Log.last_one
  end
end
