class AddAttachmentBannerToMods < ActiveRecord::Migration
  def self.up
    change_table :mods do |t|
      t.attachment :banner
    end
  end

  def self.down
    drop_attached_file :mods, :banner
  end
end
