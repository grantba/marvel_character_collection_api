class LikeSerializer
  include FastJsonapi::ObjectSerializer
  attributes :like
  belongs_to :user
  belongs_to :character
end
