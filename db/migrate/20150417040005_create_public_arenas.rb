class CreatePublicArenas < ActiveRecord::Migration
  def change
    create_table :public_arenas do |t|
      t.belongs_to :challenger_video
      t.belongs_to :challengee_video
      t.timestamps null: false
    end
  end
end
