class VotesController < ApplicationController
  def create
    if current_user
      @video = Video.find(params[:video_id])
      if User.voted?(current_user.id, @video.id) == false && @video.public_arena_as_challenger
        @vote = @video.votes.create(voter: current_user, video_id: params[:video_id])
        @public_arena = @video.public_arena_as_challenger
      elsif User.voted?(current_user.id, @video.id) == false
        @vote = @video.votes.create(voter: current_user, video_id: params[:video_id])
        @public_arena = @video.public_arena_as_challengee
      end
      @challenger_video = @public_arena.challenger_video
      redirect_to video_public_arena_path(@challenger_video, @public_arena)
    else
      redirect_to login_path
    end
  end
end