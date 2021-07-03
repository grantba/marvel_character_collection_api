class CommentSerializer
  include FastJsonapi::ObjectSerializer
  attributes :description, :character
  belongs_to :user
end
