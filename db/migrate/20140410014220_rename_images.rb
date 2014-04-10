class RenameImages < ActiveRecord::Migration
  def change
    remove_attachment :mods, :image
    remove_attachment :mods, :banner_image
    remove_attachment :mods, :thumbnail_image

    add_attachment :mods, :banner
    add_attachment :mods, :thumbnail
  end
end
