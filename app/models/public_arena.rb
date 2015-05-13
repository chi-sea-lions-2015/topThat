class PublicArena < ActiveRecord::Base
  belongs_to :challenger_video, class_name: "Video"
  belongs_to :challengee_video, class_name: "Video"


  def self.all_challenger_videos
    vidz = []
    Video.all.each { |vid| vidz << vid if  vid.public_arena_as_challenger != nil }
    vidz
  end

  def open?
    if self.challengee_video == nil
      true
    else
      false
    end
  end


  def in_battle?
    if self.challengee_video != nil && ((Time.now - self.updated_at)/60) < 3
      true
    else
      false
    end
  end

  def close?
    if self.challengee_video != nil && ((Time.now - self.updated_at)/60) >= 3
      true
    else
      false
    end
  end

  def challenger_won?
    if self.challenger_video && self.challengee_video && self.close?
      if self.challenger_video.votes.count > self.challengee_video.votes.count
        self.challenger_video.update_attributes(winner: true)
        true
      else
        false
      end
    end
  end

  def challengee_won?
    if self.challenger_video && self.challengee_video && self.close?
      if self.challengee_video.votes.count > self.challenger_video.votes.count
        self.challengee_video.update_attributes(winner: true)
        true
      else
        false
      end
    end
  end

  def tie?
    if self.challenger_video && self.challengee_video && self.close?
      if self.challengee_video.votes.count == self.challenger_video.votes.count
        true
      else
        false
      end
    end
  end

end
