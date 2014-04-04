class AddKspVersion < ActiveRecord::Migration
  def change
  	add_column :mods, :game_version, :float
  end
end
