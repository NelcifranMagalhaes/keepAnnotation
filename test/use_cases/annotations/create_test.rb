require "test_helper"

class Annotations::CreateTest < ActiveSupport::TestCase
  setup do
    @valid_params = { title: "Test Annotation", content: "Test Content" }
    @invalid_params = { title: "", content: "Test Content" }
  end

  test "should create annotation with valid params" do
    assert_difference("Annotation.count") do
      use_case = Annotations::Create.new(@valid_params).call

      assert use_case.success?
      assert_not_nil use_case.annotation
      assert use_case.annotation.persisted?
    end
  end

  test "should fail with invalid params" do
    use_case = Annotations::Create.new(@invalid_params).call

    assert use_case.failure?
    assert_not_empty use_case.errors
  end
end
