class AddAttachmentImageToParties < ActiveRecord::Migration[6.0]
  def self.up
    change_table :parties do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :parties, :image
  end
end
