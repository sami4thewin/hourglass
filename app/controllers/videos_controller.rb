class VideosController < ApplicationController

  def new
    @video = Video.new
  end

  def create
    # binding.pry
    video = Video.new
    video.description = params[:video][:description]
    video.link = params[:video][:link]
    video.save
    u_vid = UserVideo.new(user_id: current_user.id, video_id: video.id, expiration: params[:video][:user_video][:expiration].to_i)
    u_vid.save
    redirect_to video_path(video)
  end

  def show
    @video = Video.find_by(id: params[:id])
    # binding.pry
  end

  def index
    @videos = Video.all
  end

end
