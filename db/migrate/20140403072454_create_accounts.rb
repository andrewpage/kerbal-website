class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :username	

      t.string :first_name
      t.string :last_name

      t.string :country
      
      t.timestamps
    end
  end
end
