class Party < ApplicationRecord
  has_attached_file :image
  validates_attachment_content_type :image, content_type: /\Aimage/

  has_and_belongs_to_many :users
end
