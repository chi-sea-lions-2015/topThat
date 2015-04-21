class PrivateArena < ActiveRecord::Base
  belongs_to :challenger_video, class_name: "Video"
  belongs_to :challengee_video, class_name: "Video"
  enum status: [:open, :in_battle, :closed]
end
