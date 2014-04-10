class AddAttachmentThumbnailToMods < ActiveRecord::Migration
  def self.up
    change_table :mods do |t|
      t.attachment :thumbnail
    end
  end

  def self.down
    drop_attached_file :mods, :thumbnail
  end
end
