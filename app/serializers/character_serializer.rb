class CharacterSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :description, :thumbnail, :urls, :comics, :events, :series, :likes, :comments
  belongs_to :user
end
