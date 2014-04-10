class AddTypeToMod < ActiveRecord::Migration
  def change
    add_column :mods, :mod_type, :integer, default: 0
  end
end
