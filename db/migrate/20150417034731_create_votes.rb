class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.belongs_to :voter
      t.belongs_to :video

      t.timestamps null: false
    end
  end
end
