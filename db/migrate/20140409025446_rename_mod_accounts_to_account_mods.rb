class RenameModAccountsToAccountMods < ActiveRecord::Migration
  def change
    rename_table :mods_accounts, :accounts_mods
  end
end
