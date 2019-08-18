class AddIndexToUsersProviderUid < ActiveRecord::Migration[5.2]
  def change
    add_index :visitors, :provider 
    add_index :visitors, :uid 
    add_index :visitors, [:provider, :uid], unique: true
  end
end
