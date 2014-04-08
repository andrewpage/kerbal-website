class ChangeYouTubeFieldName < ActiveRecord::Migration
  def change
    remove_column :mods, :youtube_link
    add_column :mods, :youtube_url, :string
  end
end
