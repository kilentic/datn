class AddIndexToVistorsEmail < ActiveRecord::Migration[5.2]
  def change
    add_index :visitors, :email, unique: true
  end
end
