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
      end
    else
      redirect_to login_path
    end
  end
end