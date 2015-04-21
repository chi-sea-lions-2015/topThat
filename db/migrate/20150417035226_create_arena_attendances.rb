class CreateArenaAttendances < ActiveRecord::Migration
  def change
    create_table :arena_attendances do |t|
      t.belongs_to :private_arena
      t.belongs_to :attendee

      t.timestamps null: false
    end
  end
end
