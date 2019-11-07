class CreateUserAttributes < ActiveRecord::Migration[6.0]
  def change
    create_table :user_attributes do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :health
      t.integer :mana
      t.integer :gold
      t.integer :experience
      t.integer :level

      t.timestamps
    end
  end
end
