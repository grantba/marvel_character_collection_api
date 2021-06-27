require "test_helper"

class CharactersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @character = characters(:one)
  end

  test "should get index" do
    get characters_url, as: :json
    assert_response :success
  end

  test "should create character" do
    assert_difference('Character.count') do
      post characters_url, params: { character: { comics: @character.comics, description: @character.description, events: @character.events, name: @character.name, series: @character.series, thumbnail: @character.thumbnail, urls: @character.urls, user_id: @character.user_id } }, as: :json
    end

    assert_response 201
  end

  test "should show character" do
    get character_url(@character), as: :json
    assert_response :success
  end

  test "should update character" do
    patch character_url(@character), params: { character: { comics: @character.comics, description: @character.description, events: @character.events, name: @character.name, series: @character.series, thumbnail: @character.thumbnail, urls: @character.urls, user_id: @character.user_id } }, as: :json
    assert_response 200
  end

  test "should destroy character" do
    assert_difference('Character.count', -1) do
      delete character_url(@character), as: :json
    end

    assert_response 204
  end
end
