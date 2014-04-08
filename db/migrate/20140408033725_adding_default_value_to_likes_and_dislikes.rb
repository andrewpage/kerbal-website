class AddingDefaultValueToLikesAndDislikes < ActiveRecord::Migration
  def change
    change_column_default :mods, :likes, 0
    change_column_default :mods, :dislikes, 0
  end
end
