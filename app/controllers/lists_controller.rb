class ListsController < ApplicationController

  def new
    @list = List.new
    @list.tasks.build
    @tasks = Task.all
  end

  def create
  end

end
