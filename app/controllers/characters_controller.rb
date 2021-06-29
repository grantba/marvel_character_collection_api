class CharactersController < ApplicationController
  before_action :set_character, only: [:show, :update, :destroy]

  # GET /characters
  def index
    characters = Character.all
    render json: CharacterSerializer.new(characters)
  end

  # GET /characters/1
  def show
    render json: CharacterSerializer.new(@character)
  end

  # POST /characters
  def create
    character = Character.new(character_params)
    if character.save
      render json: CharacterSerializer.new(character), status: :created, location: character
    else
      render json: CharacterSerializer.new(character).errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /characters/1
  def update
    if @character.update(character_params)
      render json: CharacterSerializer.new(@character)
    else
      render json: CharacterSerializer.new(@character).errors, status: :unprocessable_entity
    end
  end

  # DELETE /characters/1
  def destroy
    if @character.destroy
      render json: {status: :ok}
    else
      render json: {status: :unprocessable_entity}
    end  
  end

  def search_by_name
    character = Character.character_by_name(params[:name], params[:ts], params[:hash])
    render json: character
  end

  def search_by_id
    character = Character.character_by_id(params[:id], params[:ts], params[:hash])
    render json: character
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_character
      @character = Character.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def character_params
      params.require(:character).permit(:name, :description, :thumbnail, :urls, :comics, :events, :series, :user_id)
    end
end