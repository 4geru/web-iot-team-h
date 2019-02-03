class MizuHistoryController < ApplicationController
  def index
    @mizu_histories = Command.where(mizu: true).order(created_at: :desc).limit(10)
    render :index
  end
end
