class LinksController < ApplicationController

  def new
    @link = Link.new
  end

  def create
    # find or create
    if link = Link.find_or_create_by(link_params)
      # link = Link.new
      # link.title = params[:link][:title]
      # link.description = params[:link][:description]
      # link.link = params[:link][:link]
      # link.save
      # link.user_links.build(expiration_params.merge({user_id: current_user.id}))
      u_link = UserLink.new(user_id: current_user.id, link_id: link.id, expiration: params[:link][:user_link][:expiration].to_i)
      if u_link.save
        redirect_to link_path(link)
      else
        @link = Link.new
        render :new
      end
    else
      render :new
    end
  end

  def show
    @link = Link.find_by(id: params[:id])
    @user_link = UserLink.where(user_id: current_user.id, link_id: @link.id)[0]
    # binding.pry
  end

  def index
    @links = Link.all
  end

  private

  def link_params
    params.require(:link).permit(:title, :description, :link)
  end

  # def expiration_params
  #   # params.require(:link).permit(:user_link =>[:expiration])
  # end

end
