class LikesController < ApplicationController
  before_action :set_like, only: [:show, :destroy]

  # GET /likes
  def index
    likes = Like.all
    render json: LikeSerializer.new(likes)
  end

  # GET /likes/1
  def show
    render json: LikeSerializer.new(@like)
  end

  # POST /likes
  def create
    like = Like.new(like_params)
    if like.save
      render json: LikeSerializer.new(like), status: :created, location: like
    else
      render json: LikeSerializer.new(like).errors, status: :unprocessable_entity
    end
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

  # DELETE /likes/1
  def destroy
    if @like.destroy
      render json: {status: :ok}
    else
      render json: {status: :unprocessable_entity}
    end  
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_like
      @like = Like.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def like_params
      params.require(:like).permit(:like_status, :user_id, :character_id)
    end
end
