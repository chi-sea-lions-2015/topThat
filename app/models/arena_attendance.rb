class ArenaAttendance < ActiveRecord::Base
  belongs_to :private_arena
  belongs_to :attendee, class_name: "User"
end
