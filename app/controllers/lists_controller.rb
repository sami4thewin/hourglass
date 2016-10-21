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
    redirect_to list_path(list)
  end

  def show
    @list = List.find_by(id: params[:id])
    # binding.pry
  end

  def destroy
    list = List.find_by(id: params[:id])
    list.destroy
    redirect_to '/'
  end

end
