class VotesController < ApplicationController
  def create
    if current_user
      @video = Video.find(params[:video_id])

      if @video.public_arena_as_challenger && User.voted?(current_user, @video) == false
        @vote = @video.votes.create(voter: current_user, video_id: params[:video_id])
        @public_arena = @video.public_arena_as_challenger
        redirect_to video_public_arena_path(@video, @public_arena)
      elsif @video.public_arena_as_challengee && User.voted?(current_user, @video) == false
        @vote = @video.votes.create(voter: current_user, video_id: params[:video_id])
        @public_arena = @video.public_arena_as_challengee
        @challenger_video = @public_arena.challenger_video
        redirect_to video_public_arena_path(@challenger_video, @public_arena)
      else
        if @video.public_arena_as_challenger
          @public_arena = @video.public_arena_as_challenger
          puts "Hello!"
          redirect_to video_public_arena_path(@video, @public_arena), notice: "You already voted on this battle!"
        else
          @public_arena = @video.public_arena_as_challengee
          @challenger_video = @public_arena.challenger_video
          puts "Hi!"
          redirect_to video_public_arena_path(@challenger_video, @public_arena), notice: "You already voted on this battle!"
        end
      end
    else
      redirect_to login_path
    end
  end
end