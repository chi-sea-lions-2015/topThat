class PublicArena < ActiveRecord::Base
  belongs_to :challenger_video, class_name: "Video"
  belongs_to :challengee_video, class_name: "Video"


  def self.all_challenger_videos
    vidz = []
    Video.all.each { |vid| vidz << vid if  vid.public_arena_as_challenger != nil }
    vidz
  end

  def open?
    if self.challengee_video == nil && !self.close?
      true
    else
      false
    end
  end


  def in_battle?
    if self.challengee_video != nil && !self.close?
      true
    else
      false
    end
  end

  def close?
    if ((Time.now - self.created_at)/60) >= 15
      true
    else
      false
    end
  end

end
