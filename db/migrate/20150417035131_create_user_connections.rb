class CreateUserConnections < ActiveRecord::Migration
  def change
    create_table :user_connections do |t|
      t.belongs_to :inviter
      t.belongs_to :invitee

      t.timestamps null: false
    end
  end
end
