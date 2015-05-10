
class User < ActiveRecord::Base
  has_secure_password



  has_many :votes, foreign_key: :voter_id
  has_many :videos
  has_many :arena_attendances, foreign_key: :attendee_id
  has_many :private_arenas, through: :arena_attendances
  has_many :user_connections, foreign_key: :inviter_id
  has_many :user_connections_as_an_invitee, class_name: "UserConnections", foreign_key: :invitee_id


  validates :username, :uniqueness => true
  validates :email, :uniqueness => true, :format => /.+@.+\..+/
  validates :username, :email, :presence => true

  mount_uploader :avatar, AvatarUploader

#write method to create friends
  def self.voted?(user, video)
    @video = video
    @user = user
    if @video.public_arena_as_challenger
      @public_arena = @video.public_arena_as_challenger
      @challengee_video = @public_arena.challengee_video
      @vote_one = @video.votes.find_by(voter_id: @user.id)
      @vote_two = @challengee_video.votes.find_by(voter_id: @user.id)
      if @vote_one != nil || @vote_two != nil
        true
      else
        false
      end
    else
      @public_arena = @video.public_arena_as_challengee
      @challenger_video = @public_arena.challenger_video
      @vote_one = @video.votes.find_by(voter_id: @user.id)
      @vote_two = @challenger_video.votes.find_by(voter_id: @user.id)
      if @vote_one != nil || @vote_two != nil
        true
      else
        false
      end
    end
  end

end
