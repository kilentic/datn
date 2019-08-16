class CreateVisitors < ActiveRecord::Migration[5.2]
  def change
    create_table :visitors do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.integer :provider
      t.integer :uid
      t.string :remember_digest
      t.string :activation_digest
      t.string :remember_digest
      t.boolean :activated
      t.datetime :activated_at
      t.datetime :reset_sent_at
      t.integer :refer_id
      t.string :refer_type

      t.timestamps
    end
  end
end
