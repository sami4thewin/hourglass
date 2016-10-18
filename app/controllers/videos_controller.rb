class VideosController < ApplicationController

  def new
    @video = Video.new
  end

end
