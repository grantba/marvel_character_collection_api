class LikesController < ApplicationController

  # GET /likes
  def index
    likes = Like.all
    render json: LikeSerializer.new(likes)
  end

  # PATCH/PUT /likes/1
  def update
    # finds like for character that matches user_id
    like = Character.findLikes(params);
    # if like already exists then it will be updated
    if !like.blank?
      like.update(like_params)
      render json: LikeSerializer.new(like)
    else
      # if like does not already exist then a new like is created
      like = Like.new(like_params)
      if like.save
        render json: LikeSerializer.new(like)
      else
        render json: {status: :unprocessable_entity}
      end
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def like_params
      params.require(:like).permit(:like_status, :user_id, :character_id)
    end
end
