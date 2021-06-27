class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :username, :email, :bio, :image
  has_many :characters
  has_many :likes
  has_many :comments
end
