class ListTasksController < ApplicationController

  def destroy
    # binding.pry
    lt = ListTask.find_by(id: params[:id])
    @a = lt.list
    @a.user.completed += 1
    @a.user.save
    lt.destroy
    redirect_to list_path(@a)
  end

end
