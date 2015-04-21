class WelcomeController < ApplicationController

  def index #research how to take thumbnail of video
   if current_user
     @user = current_user
   end
   @video = Video.new
   @challenger_videos = PublicArena.all_challenger_videos
   render "index"
  end


end
