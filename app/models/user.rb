
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
  def self.voted?(user_id, video_id)
    @video = Video.find(video_id)
    @public_arena_as_challenger = @video.public_arena_as_challenger
    @public_arena_as_challengee = @video.public_arena_as_challengee
    if @public_arena_as_challenger != nil
      @challengee_video = @public_arena_as_challenger.challengee_video
      @challenger_vote = @video.votes.find_by(voter_id: user_id)
      @challengee_vote = @challengee_video.votes.find_by(voter_id: user_id)
      if @challenger_vote != nil && @challengee_vote !=nil
        true
      else
        false
      end
    else
      @challenger_video = @public_arena_as_challengee.challenger_video
      @challenger_vote = @challenger_video.votes.find_by(voter_id: user_id)
      @challengee_vote = video.votes.find_by(voter_id: user_id)
      if @challenger_vote != nil && @challengee_vote !=nil
        true
      else
        false
      end
    end
  end

end
