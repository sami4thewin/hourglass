class UserLinksController < ApplicationController

  def destroy
    # binding.pry
    link = UserLink.find_by(id: params[:id])
    link.user.completed += 1
    link.user.save
    link.destroy
    redirect_to '/'
  end

end
