class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :username, :bio, :image
end
