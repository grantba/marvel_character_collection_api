class CharacterSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :description, :thumbnail, :urls, :comics, :events, :series, :user, :likes, :comments
end
