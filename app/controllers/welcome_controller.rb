class WelcomeController < ApplicationController

  def index #research how to take thumbnail of video
   if current_user
     @user = current_user
   end
   @public_arenas = PublicArena.all
   @video = Video.new
   @challenger_videos = PublicArena.all_challenger_videos
   render "index"
  end


#all you need to do is make sure that you get something tht ends in @challenger videos
# @challenger videos will be a collection of videos that have a public arena who's status is either 'open' 'closed' or 'in_battle'

  def show
    @user = current_user
    all_challenges = PublicArena.all_challenger_videos
    @battle_videos = []
    @closed_videos = []
    @open_videos = []
    @video = Video.new

    all_challenges.map do |vid|
      if params[:status] == "open" && vid.public_arena_as_challenger.open?
        @open_videos << vid
      elsif params[:status] == "in_battle" && vid.public_arena_as_challenger.in_battle?
        @battle_videos << vid
      elsif params[:status] == "closed" && vid.public_arena_as_challenger.close?
        @closed_videos << vid
      end
    end
  end
end
