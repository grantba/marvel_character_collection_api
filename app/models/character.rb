class Character < ApplicationRecord
  require 'digest/md5'

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  def self.character_by_name(name, ts)
    hash = Digest::MD5.hexdigest("#{ts}#{ENV["PRIVATE_KEY"]}#{ENV["PUBLIC_KEY"]}")
    response = RestClient.get("http://gateway.marvel.com/v1/public/characters?nameStartsWith=#{name}&ts=#{ts}&apikey=#{ENV["PUBLIC_KEY"]}&hash=#{hash}")
    character_response = JSON.parse(response)
  end

  def self.character_by_id(id, ts)
    hash = Digest::MD5.hexdigest("#{ts}#{ENV["PRIVATE_KEY"]}#{ENV["PUBLIC_KEY"]}")
    response = RestClient.get("http://gateway.marvel.com/v1/public/characters/#{id}?&ts=#{ts}&apikey=#{ENV["PUBLIC_KEY"]}&hash=#{hash}")
    character_response = JSON.parse(response)
  end

  def self.findLikes(params)
    c = Character.find_by_id(params[:character_id])
    like = c.likes.where(user_id: params[:user_id])
    return like
  end
end
