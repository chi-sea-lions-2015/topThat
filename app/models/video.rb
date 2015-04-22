class Video < ActiveRecord::Base

  belongs_to :user
  has_many :votes
  has_one :private_arena_as_challenger, class_name: "PrivateArena", foreign_key: :challenger_video_id
  has_one :private_arena_as_challengee, class_name: "PrivateArena", foreign_key: :challengee_video_id
  has_one :public_arena_as_challenger, class_name: "PublicArena", foreign_key: :challenger_video_id
  has_one :public_arena_as_challengee, class_name: "PublicArena", foreign_key: :challengee_video_id
  validates :title, presence: true


mount_uploader :data_content, VideoUploader


end

