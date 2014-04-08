class AddModFileToMods < ActiveRecord::Migration
  def change
    add_attachment :mods, :mod_file
  end
end
