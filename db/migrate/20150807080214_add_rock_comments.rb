class AddRockComments < ActiveRecord::Migration
  def change
    create_table :rock_comments do |t|
        t.text :text
        t.belongs_to :user
        t.belongs_to :rock

        t.timestamps
    end

    add_index :rock_comments, :rock_id
  end
end
