class AddAttachmentPhotoToPius < ActiveRecord::Migration[6.0]
  def self.up
    change_table :pius do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :pius, :photo
  end
end
