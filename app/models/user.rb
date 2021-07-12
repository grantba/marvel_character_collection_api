class User < ApplicationRecord
    has_secure_password
    has_many :characters, dependent: :destroy
    has_many :comments, dependent: :destroy
    has_many :likes, dependent: :destroy

    validates :username, :email, presence: true, uniqueness: true, length: { minimum: 6, message: "Username must be unique. Unfortunately, someone has already taken that username." }
    validates :email, format: { with: /\A([^\s]+)((?:[-a-z0-9]\.)[a-z]{2,})\z/i, message: "You must provide a valid email address, for example, user@email.com." }
end
