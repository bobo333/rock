class CreateRock < ActiveRecord::Migration
  def change
    create_table :rocks do |t|
        t.belongs_to :user
        t.text :title
        t.text :description

        t.timestamps
    end

    add_index :rocks, :user_id

  end
end
