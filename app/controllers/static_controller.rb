class StaticController < ApplicationController
  def home
    @user = current_user

    if Link.top.user_links.count == 0
      @link_message = "There is no current top link, do your part and add one below!"
    else
      @link_message = "The current top link is #{Link.top.title}, it's been shared #{Link.top.user_links.count} times."
    end


  end
end

#
