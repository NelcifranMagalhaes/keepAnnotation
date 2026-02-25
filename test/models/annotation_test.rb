require "test_helper"

class AnnotationTest < ActiveSupport::TestCase
  test "should not save annotation without title" do
    annotation = Annotation.new(content: "Test content")
    assert_not annotation.save, "Saved the annotation without a title"
  end

  test "should save annotation without content" do
    annotation = Annotation.new(title: "Test title")
    assert annotation.save, "Failed to save an annotation without content"
  end

  test "should save valid annotation" do
    annotation = Annotation.new(title: "Test title", content: "Test content")
    assert annotation.save, "Failed to save a valid annotation"
  end
end
