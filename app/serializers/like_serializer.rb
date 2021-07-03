class LikeSerializer
  include FastJsonapi::ObjectSerializer
  attributes :like_status, :character
  belongs_to :user
end
