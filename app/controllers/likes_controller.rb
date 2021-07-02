class LikesController < ApplicationController

  # GET /likes
  def index
    likes = Like.all
    render json: LikeSerializer.new(likes)
  end

  # PATCH/PUT /likes/1
  def update
    like = Character.findLikes(params);
    if !like.blank?
      like.update(like_params)
      render json: LikeSerializer.new(like)
    else
      like = Like.new(like_params)
      if like.save
        render json: LikeSerializer.new(like)
      else
        render json: LikeSerializer.new(like).errors, status: :unprocessable_entity
      end
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def like_params
      params.require(:like).permit(:like_status, :user_id, :character_id)
    end
end
