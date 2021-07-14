class User < ApplicationRecord
    has_secure_password
    has_many :characters, dependent: :destroy
    has_many :comments, dependent: :destroy
    has_many :likes, dependent: :destroy

    validates :username, :email, presence: {message: "You must provide a username and email."}
    validates :username, uniqueness: {message: "Username must be unique. Unfortunately, someone has already taken that username."}
    validates :email, uniqueness: {message: "Email must be unique. That email already exists. If you have already created an account, please login instead."}
    validates :username, length: {minimum: 6, message: "Username must be at least 6 characters in length."}
    validates :email, format: {with: /\A([^\s]+)((?:[-a-z0-9]\.)[a-z]{2,})\z/i, message: "You must provide a valid email address, for example, user@email.com."}
end
