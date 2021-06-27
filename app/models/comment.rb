class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :character

  validates :description, presence: true
end
