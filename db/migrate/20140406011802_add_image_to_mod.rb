class AddImageToMod < ActiveRecord::Migration
  def change
    add_attachment :mods, :image
  end
end
