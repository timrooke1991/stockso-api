class Post < ApplicationRecord
  belongs_to :share, optional: true
  belongs_to :user
  validates :user_id, presence: true
  validates :share_id, presence: true
  validates :body, length: { minimum: 0, maximum: 142 }, allow_blank: false
end
