class AddNewImages < ActiveRecord::Migration
  def change
    remove_column :mods, :image

    add_attachment :mods, :thumbnail_image
    add_attachment :mods, :banner_image
  end
end
