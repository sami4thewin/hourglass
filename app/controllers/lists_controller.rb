class ListsController < ApplicationController

  def new
    @list = List.new
    @list.tasks.build
    @tasks = Task.all
  end

  def create
    # binding.pry
    list = List.create(user_id: current_user.id, title: params[:list][:title])
    list.tasks_attributes=(params)
  end

end
