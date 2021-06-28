class Character < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes

  def self.character_by_name(name, ts, hash)
    response = RestClient.get("http://gateway.marvel.com/v1/public/characters?nameStartsWith=#{name}&ts=#{ts}&apikey=#{ENV["PUBLIC_KEY"]}&hash=#{hash}")
    character_response = JSON.parse(response)
  end

  def self.character_by_id(id, ts, hash)
    response = RestClient.get("http://gateway.marvel.com/v1/public/characters/#{id}?&ts=#{ts}&apikey=#{ENV["PUBLIC_KEY"]}&hash=#{hash}")
    character_response = JSON.parse(response)
  end

  def self.findLikes(params)
    c = Character.find_by_id(params[:character_id])
    like = c.likes.where(user_id: params[:user_id])
    return like
  end
end
