class VideosController < ApplicationController

  def new
    @video = Video.new
  end

  def create
    # binding.pry
    if video = Video.find_or_create_by(video_params)
      # video.description = params[:video][:description]
      # video.link = params[:video][:link]
      # video.save
      u_vid = UserVideo.new(user_id: current_user.id, video_id: video.id, expiration: params[:video][:user_video][:expiration].to_i)
      if u_vid.save
        redirect_to video_path(video)
      else
        @video = Video.new
        render :new
      end
    else
      render :new
    end
  end

  def show
    @video = Video.find_by(id: params[:id])
    @user_video = UserVideo.where(user_id: current_user.id, video_id: @video.id)[0]
    # binding.pry

  end

  def index
    @videos = Video.all
  end

  def destroy

  end

  private

  def video_params
    params.require(:video).permit(:description, :link)
  end

end
