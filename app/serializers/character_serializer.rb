class CharacterSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :description, :thumbnail, :urls, :comics, :events, :series
  belongs_to :user
  has_many :comments
  has_many :likes
end
