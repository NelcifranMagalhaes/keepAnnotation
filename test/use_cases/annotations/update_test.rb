require "test_helper"

class Annotations::DeleteTest < ActiveSupport::TestCase
  setup do
    @annotation = annotations(:one)
  end

  test "should delete annotation" do
    annotation_id = @annotation.id

    assert_difference("Annotation.count", -1) do
      use_case = Annotations::Delete.new(annotation_id).call

      assert use_case.success?
    end
  end

  test "should fail when annotation not found" do
    use_case = Annotations::Delete.new(999999).call

    assert use_case.failure?
    assert_includes use_case.errors, "Annotation not found"
  end
end
