class LedChartsController < ApplicationController
  def index
    @commands = Command.all[1..-1] || []
  end
end
