class PublicArenasController < ApplicationController

  def show
    @user = current_user
    @public_arena = PublicArena.find(params[:id])
    @challenger_video = @public_arena.challenger_video
    @challengee_video = @public_arena.challengee_video
    @challengee_user  = @challengee_video.user
    @vote = Vote.new
    @votes_for_challenger = @challenger_video.votes
    if @challengee_video
        @votes_for_challengee = @challengee_video.votes
    end
  end

  # def create
  #   @public_arena = PublicArena.create(public_arena_params)
  # end

  def edit
    @challenger_video = Video.find(params[:video_id])
    @public_arena = PublicArena.find(params[:id])
    @challengee_video =  Video.new
  end


  def update
    @challengee_video = Video.create(user: current_user, title: params[:public_arena][:challengee_video], data_content: params[:public_arena][:challengee_video_id])
    @public_arena = PublicArena.find(params[:id])
    @public_arena.update_attributes(challengee_video: @challengee_video)
    AlertMailer.challenge_accepted_email(@public_arena).deliver_now
    AlertMailer.challenge_confirmation_email(@public_arena).deliver_now
    redirect_to video_public_arena_path(@public_arena.challenger_video, @public_arena)
  end

  # def destroy
  #   @user = current_user
  #   @public_arena = PublicArena.find(params[:id])
  #   @public_arena.destroy!
  # end

private

   def public_arena_params
    params.require(:public_arena).permit(:challenger_video, :challengee_video, :status)
   end

end
