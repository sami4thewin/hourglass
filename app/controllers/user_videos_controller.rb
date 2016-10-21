class UserVideosController < ApplicationController

  def destroy
    # binding.pry
    vid = UserVideo.find_by(id: params[:id])
    vid.user.completed += 1
    vid.user.save
    vid.destroy
    redirect_to '/'
  end

end
