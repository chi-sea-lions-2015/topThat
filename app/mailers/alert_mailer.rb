class AlertMailer < ApplicationMailer
  default from: 'topthatdevteam@gmail.com'

  def welcome_email(user)
    @user = user
    @url  = "http://localhost:3000/login"
    mail(to: @user.email, subject: 'Welcome to TopThat!')
  end

  def winner_email(user, arena)
    @user = user
    @video_id = arena.challenger_video.id
    @arena_id = arena.id
    @url  = "http://localhost:3000/videos/#{@video_id}/public_arenas/#{@arena_id}"
    mail(to: @user.email, subject: 'Results of battle...') do |format|
      format.text
      format.html
    end
  end

  def loser_email(user, arena)
    @user = user
    @video_id = arena.challenger_video.id
    @arena_id = arena.id
    @url  = "http://localhost:3000/videos/#{@video_id}/public_arenas/#{@arena_id}"
    mail(to: @user.email, subject: 'Results of battle...') do |format|
      format.text
      format.html
    end
  end

  def tie_email(user, arena)
    @user = user
    @video_id = arena.challenger_video.id
    @arena_id = arena.id
    @url  = "http://localhost:3000/videos/#{@video_id}/public_arenas/#{@arena_id}"
    mail(to: @user.email, subject: 'Results of battle...') do |format|
      format.text
      format.html

    end
  end

  def no_challengee_email(user, arena)
    @user = user
    @video_id = arena.challenger_video.id
    @arena_id = arena.id
    @url  = "http://localhost:3000/videos/#{@video_id}/public_arenas/#{@arena_id}"
    mail(to: @user.email, subject: 'No one accepted challenge...') do |format|
      format.text
      format.html
    end
  end


end
