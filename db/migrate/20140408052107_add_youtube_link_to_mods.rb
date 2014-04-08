class AddYoutubeLinkToMods < ActiveRecord::Migration
  def change
    add_column :mods, :youtube_link, :string
  end
end
