class WelcomeController < ApplicationController

  def index #research how to take thumbnail of video
   if current_user
     @user = current_user
   end
   @video = Video.new
   @challenger_videos = PublicArena.all_challenger_videos
   render "index"
  end


  def show 
    puts params
    if params[:status] == "closed"
      public_arena = PublicArena.where(status: "closed")
    elsif params[:status] == "in_battle"
      public_arena = PublicArena.where(status: "in_battle")
    else 
      public_arena = PublicArena.where(status: "open")
    end 

    @challenger_videos = public_arena.all_challenger_videos
  end 
end
