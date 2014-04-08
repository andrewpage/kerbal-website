class AddDefaultAmountOfDownloads < ActiveRecord::Migration
  def change
    change_column_default :mods, :download_count, 0
  end
end
