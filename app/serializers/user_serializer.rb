class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :username, :email, :bio, :image, :likes, :comments, :characters
end
