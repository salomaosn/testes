class Piu < ApplicationRecord
  belongs_to :user

  validates :user, presence: true
  validates :content, presence: true, length: { maximum: 140 }

  has_attached_file :photo

  do_not_validate_attachment_file_type :photo
end
