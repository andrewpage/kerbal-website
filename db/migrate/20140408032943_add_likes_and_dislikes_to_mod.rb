class AddLikesAndDislikesToMod < ActiveRecord::Migration
  def change
    add_column :mods, :likes, :integer
    add_column :mods, :dislikes, :integer
  end
end
