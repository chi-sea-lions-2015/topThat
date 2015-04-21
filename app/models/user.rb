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

#write method to create friends

end
