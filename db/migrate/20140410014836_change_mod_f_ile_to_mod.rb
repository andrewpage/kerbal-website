class ChangeModFIleToMod < ActiveRecord::Migration
  def change
    remove_attachment :mods, :mod_file

    add_attachment :mods, :mod
  end
end
