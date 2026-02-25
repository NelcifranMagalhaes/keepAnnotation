require "test_helper"

class Annotations::ShowTest < ActiveSupport::TestCase
  setup do
    @annotation = annotations(:one)
  end

  test "should show annotation" do
    use_case = Annotations::Show.new(@annotation.id).call

    assert use_case.success?
    assert_equal @annotation.id, use_case.annotation.id
  end

  test "should fail when annotation not found" do
    use_case = Annotations::Show.new(999999).call

    assert use_case.failure?
    assert_includes use_case.errors, "Annotation not found"
  end
end
