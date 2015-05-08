class AlertMailer < ApplicationMailer
  default from: 'topthatdevteam@gmail.com'

  def welcome_email(user)
    @user = user
    @url  = "https://top-that.herokuapp.com/login"
    mail(to: @user.email, subject: 'Welcome to TopThat!')
  end

  def winner_email(user, arena)
    @user = user
    @video_id = arena.challenger_video.id
    @arena_id = arena.id
    @url  = "https://top-that.herokuapp.com/videos/#{@video_id}/public_arenas/#{@arena_id}"
    mail(to: @user.email, subject: 'Results of TopThat battle...') do |format|
      format.text
      format.html
    end
  end

  def loser_email(user, arena)
    @user = user
    @video_id = arena.challenger_video.id
    @arena_id = arena.id
    @url  = "https://top-that.herokuapp.com/videos/#{@video_id}/public_arenas/#{@arena_id}"
    mail(to: @user.email, subject: 'Results of TopThat battle...') do |format|
      format.text
      format.html
    end
  end

  def tie_email(user, arena)
    @user = user
    @video_id = arena.challenger_video.id
    @arena_id = arena.id
    @url  = "https://top-that.herokuapp.com/videos/#{@video_id}/public_arenas/#{@arena_id}"
    mail(to: @user.email, subject: 'Results of TopThat battle...') do |format|
      format.text
      format.html

    end
  end

  def no_challengee_email(user, arena)
    @user = user
    @video_id = arena.challenger_video.id
    @arena_id = arena.id
    @url  = "https://top-that.herokuapp.com/videos/#{@video_id}/public_arenas/#{@arena_id}"
    mail(to: @user.email, subject: 'No one accepted your TopThat challenge') do |format|
      format.text
      format.html
    end
  end

  def challenge_accepted_email(arena)
    @video_id = arena.challenger_video.id
    @arena_id = arena.id
    @user = arena.challenger_video.user

    @url  = "https://top-that.herokuapp.com/videos/#{@video_id}/public_arenas/#{@arena_id}"
    mail(to: @user.email, subject: 'Your TopThat challenge has been accepted!') do |format|
      format.text
      format.html
    end
  end

  def challenge_confirmation_email(arena)
    @video_id = arena.challenger_video.id
    @arena_id = arena.id
    @user = arena.challengee_video.user

    @url  = "https://top-that.herokuapp.com/videos/#{@video_id}/public_arenas/#{@arena_id}"
    mail(to: @user.email, subject: 'Your TopThat video is now in battle!') do |format|
      format.text
      format.html
    end
  end


end
