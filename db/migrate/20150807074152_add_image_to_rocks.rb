class AddImageToRocks < ActiveRecord::Migration
  def up
    add_attachment :rocks, :image
  end

  def down
    remove_attachment :rocks, :image
  end
end
