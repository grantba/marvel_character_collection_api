class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :username, :email, :bio, :image
end
