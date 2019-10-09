class CreateParties < ActiveRecord::Migration[6.0]
  def change
    create_table :parties do |t|
      t.string :name
      t.datetime :begin
      t.datetime :end
      t.float :hours

      t.timestamps
    end
  end
end
