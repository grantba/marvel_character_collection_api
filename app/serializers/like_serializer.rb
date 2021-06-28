class LikeSerializer
  include FastJsonapi::ObjectSerializer
  attributes :like_status, :user, :character
end
