class CreateModsAccounts < ActiveRecord::Migration
  def change
    create_table :mods_accounts, :id => false do |t|
      t.references :mod
      t.references :account
    end
    add_index :mods_accounts, [:mod_id, :account_id]
    add_index :mods_accounts, :account_id
  end
end
