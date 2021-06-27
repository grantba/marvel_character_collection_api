class User < ApplicationRecord
    has_many :characters
    has_many :comments
    has_many :likes

    validates :username, presence: true
    validates_format_of :email, with: /\A([^\s]+)((?:[-a-z0-9]\.)[a-z]{2,})\z/i
end
