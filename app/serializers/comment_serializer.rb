class CommentSerializer
  include FastJsonapi::ObjectSerializer
  attributes :description
  belongs_to :user
  belongs_to :character
end
