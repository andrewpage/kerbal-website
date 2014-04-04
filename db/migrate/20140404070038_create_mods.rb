class CreateMods < ActiveRecord::Migration
  def change
    create_table :mods do |t|
    	t.string :name
    	t.text :description
    	t.string :description_short
    	
    	t.float :version
    	t.string :tags
    	t.integer :download_count

    	t.integer :account_id

    	t.timestamps
    end
  end
end
