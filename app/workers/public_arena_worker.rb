class PublicArenaWorker
  include Sidekiq::Worker

  def perform(arena_id)
    Rails.logger.warn Rails.env
    arena = PublicArena.find(arena_id)
    if arena.challenger_won?
      user = arena.challenger_video.user
      loser = arena.challengee_video.user
      AlertMailer.winner_email(user, arena)
      AlertMailer.loser_email(loser, arena)
    elsif arena.challengee_won?
      user = arena.challengee_video.user
      loser = arena.challenger_video.user
      AlertMailer.winner_email(user, arena)
      AlertMailer.loser_email(loser, arena)
    elsif arena.tie?
      user_one = arena.challengee_video.user
      AlertMailer.tie_email(user_one, arena)
      user_two = arena.challengee_video.user
      AlertMailer.tie_email(user_two, arena)
    else
      user = arena.challenger_video.user
      AlertMailer.no_challengee_email(user, arena)
    end
  end

end

 # format.html { redirect_to(@user)}
 #        format.json { render json: @user, status: :created, location: @user }

