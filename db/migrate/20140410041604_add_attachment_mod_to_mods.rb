class AddAttachmentModToMods < ActiveRecord::Migration
  def self.up
    change_table :mods do |t|
      t.attachment :mod
    end
  end

  def self.down
    drop_attached_file :mods, :mod
  end
end
