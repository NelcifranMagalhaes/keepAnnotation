require "test_helper"

class AnnotationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @annotation = annotations(:one)
  end

  test "should get index" do
    get annotations_url, as: :json
    assert_response :success
    response_body = JSON.parse(@response.body)
    assert_kind_of Hash, response_body
    assert_includes response_body.keys, "data"
    assert_kind_of Array, response_body["data"]
  end

  test "should create annotation" do
    assert_difference("Annotation.count") do
      post annotations_url, params: { annotation: { content: "New content", title: "New title" } }, as: :json
    end

    assert_response :created
    response_body = JSON.parse(@response.body)
    assert_equal "New title", response_body["title"]
  end

  test "should show annotation" do
    get annotation_url(@annotation), as: :json
    assert_response :success
    response_body = JSON.parse(@response.body)
    assert_equal @annotation.id, response_body["id"]
  end

  test "should show not found when annotation does not exist" do
    get annotation_url(999999), as: :json
    assert_response :not_found
  end

  test "should update annotation" do
    patch annotation_url(@annotation), params: { annotation: { title: "Updated" } }, as: :json
    assert_response :success
    response_body = JSON.parse(@response.body)
    assert_equal "Updated", response_body["title"]
  end

  test "should destroy annotation" do
    assert_difference("Annotation.count", -1) do
      delete annotation_url(@annotation), as: :json
    end

    assert_response :no_content
  end

  test "should not destroy nonexistent annotation" do
    delete annotation_url(999999), as: :json
    assert_response :not_found
  end
end
