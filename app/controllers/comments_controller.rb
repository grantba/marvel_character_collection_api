class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :update, :destroy]

  # GET /comments
  def index
    comments = Comment.all
    render json: CommentSerializer.new(comments)
  end

  # GET /comments/1
  def show
    render json: CommentSerializer.new(@comment)
  end

  # POST /comments
  def create
    comment = Comment.new(comment_params)
    if comment.save
      render json: CommentSerializer.new(comment), status: :created, location: comment
    else
      render json: CommentSerializer.new(comment).errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /comments/1
  def update
    if @comment.update(comment_params)
      render json: CommentSerializer.new(@comment)
    else
      render json: CommentSerializer.new(@comment).errors, status: :unprocessable_entity
    end
  end

  # DELETE /comments/1
  def destroy
    if @comment
      @comment.destroy
      render json: CommentSerializer.new(@comment)
    else
      render json: CommentSerializer.new(@comment).errors, status: :unprocessable_entity
    end   
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:comment).permit(:description, :user_id, :comment_id)
    end
end