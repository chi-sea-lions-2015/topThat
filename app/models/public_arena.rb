class PublicArena < ActiveRecord::Base
  belongs_to :challenger_video, class_name: "Video"
  belongs_to :challengee_video, class_name: "Video"
  enum status: [:open, :closed, :in_battle]


  def self.all_challenger_videos
    vidz = []
    Video.all.each { |vid| vidz << vid if  vid.public_arena_as_challenger != nil }
    vidz
  end


end
