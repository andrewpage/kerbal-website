class NewPaperclipGenerator < ActiveRecord::Migration
  def change
    remove_attachment :mods, :thumbnail
    remove_attachment :mods, :banner
    remove_attachment :mods, :mod
  end
end
