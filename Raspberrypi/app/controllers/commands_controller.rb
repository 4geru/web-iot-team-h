class CommandsController < ApplicationController
  before_action :allow_origin
  def index
    @command = Command.last_one
    @command_attributes = Command.new.attributes.keys - ['id', 'created_at', 'updated_at']
    render :index, formats: 'json'
  end

  def update
    @command = Command.find(params[:id])
    Command.create(update_commands_params)
    redirect_to root_path
  end

  private
  def allow_origin
    headers['Access-Control-Allow-Origin'] = '*'
  end

  def update_commands_params
    @command.attributes.except('id').except('created_at').except('updated_at').merge(params[:command].permit!.to_h)
  end
end
