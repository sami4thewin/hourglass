class ListsController < ApplicationController

  def new
    @list = List.new
    @list.tasks.build
    @tasks = Task.all
  end

  def create
    # binding.pry
    # list = List.create(list_params)
    if params[:list][:list_task][:expiration].to_i < 4 && params[:list][:list_task][:expiration].to_i > 0
      # list = List.create(user_id: current_user.id, title: params[:list][:title])
      list = current_user.lists.build(title: params[:list][:title])
      list.save
      list.tasks_attributes=(params)
      # binding.pry
      redirect_to list_path(list)
    else
      redirect_to new_list_path
    end
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

  def edit
    @list = List.find_by(id: params[:id])
    # @list_id = params[:id]
    # @new_list = List.new
    # print @list.user
    # print @list.tasks.map { |t| t.description }
    # @new_list.tasks.build
    # puts @list.tasks
  end

  def update
    @list = List.find_by(id: params[:id])
    # list.tasks_attributes=(params)
    # binding.pry
    if !params[:list][:new_task_1][:description].empty?
      t = Task.find_or_create_by(description: params[:list][:new_task_1][:description])
      lt = ListTask.create(list_id: @list.id, task_id: t.id, expiration: params[:list][:list_task][:expiration].to_i)
    end
    if !params[:list][:new_task_2][:description].empty?
      y = Task.find_or_create_by(description: params[:list][:new_task_2][:description])
      ly = ListTask.create(list_id: @list.id, task_id: y.id, expiration: params[:list][:list_task][:expiration].to_i)
    end
    if !params[:list][:new_task_3][:description].empty?
      z = Task.find_or_create_by(description: params[:list][:new_task_3][:description])
      lz = ListTask.create(list_id: @list.id, task_id: z.id, expiration: params[:list][:list_task][:expiration].to_i)
    end
    redirect_to list_path(@list)
  end

  private

  def list_params
    params.require(:list).permit(:title, tasks_attributes:[:description], list_task:[:expiration])
  end

  #
  # def list_params
  #   params.require(:list).permit(:title)
  # end

  # def list_params(*args)
  #   params.require(:list).permit(:title, :tasks_attributes)
  # end

end






# class ListsController < ApplicationController
#
#   def new
#     @list = List.new
#     @list.tasks.build
#     @tasks = Task.all
#   end
#
#   def create
#     binding.pry
#     # list = List.create(list_params)
#     if params[:list][:list_task][:expiration].to_i < 4 && params[:list][:list_task][:expiration].to_i > 0
#       # binding.pry
#       # list = List.create(user_id: current_user.id, title: params[:list][:title])
#       info = list_params
#       info[:tasks_attributes].each do |t_a|
#         t_a[:expiration] = params[:list][:list_task][:expiration]
#       end
#
#       current_user.lists.create(info)
#       # binding.pry
#       # list.tasks_attributes=(params)
#       # list.update(list_params)
#       # binding.pry
#       redirect_to list_path(list)
#     else
#       redirect_to new_list_path
#     end
#   end
#
#   def show
#     @list = List.find_by(id: params[:id])
#     # binding.pry
#   end
#
#   def destroy
#     list = List.find_by(id: params[:id])
#     list.destroy
#     redirect_to '/'
#   end
#
#   def edit
#     @list = List.find_by(id: params[:id])
#     @list.tasks.build
#   end
#
#   def update
#     @list = List.find_by(id: params[:id])
#     # list.tasks_attributes=(params)
#     # binding.pry
#     if !params[:list][:new_task_1][:description].empty?
#       t = Task.find_or_create_by(description: params[:list][:new_task_1][:description])
#       lt = ListTask.create(list_id: @list.id, task_id: t.id, expiration: params[:list][:list_task][:expiration].to_i)
#     end
#     if !params[:list][:new_task_2][:description].empty?
#       y = Task.find_or_create_by(description: params[:list][:new_task_2][:description])
#       ly = ListTask.create(list_id: @list.id, task_id: y.id, expiration: params[:list][:list_task][:expiration].to_i)
#     end
#     if !params[:list][:new_task_3][:description].empty?
#       z = Task.find_or_create_by(description: params[:list][:new_task_3][:description])
#       lz = ListTask.create(list_id: @list.id, task_id: z.id, expiration: params[:list][:list_task][:expiration].to_i)
#     end
#     redirect_to list_path(@list)
#   end
#
#   private
#   #
#   def list_params
#     params.require(:list).permit(:title, tasks_attributes:[:description], list_task:[:expiration])
#   end
#
#   # def list_params(*args)
#   #   params.require(:list).permit(:title, :tasks_attributes)
#   # end
#
# end
