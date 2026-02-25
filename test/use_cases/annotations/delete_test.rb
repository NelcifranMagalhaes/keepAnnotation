require "test_helper"

class Annotations::UpdateTest < ActiveSupport::TestCase
  setup do
    @annotation = annotations(:one)
    @valid_params = { title: "Updated Title", content: "Updated Content" }
    @invalid_params = { title: "", content: "Test" }
  end

  test "should update annotation with valid params" do
    use_case = Annotations::Update.new(@annotation.id, @valid_params).call

    assert use_case.success?
    assert_equal "Updated Title", use_case.annotation.title
  end

  test "should fail with invalid params" do
    use_case = Annotations::Update.new(@annotation.id, @invalid_params).call

    assert use_case.failure?
    assert_not_empty use_case.errors
  end

  test "should fail when annotation not found" do
    use_case = Annotations::Update.new(999999, @valid_params).call

    assert use_case.failure?
    assert_includes use_case.errors, "Annotation not found"
  end
end
