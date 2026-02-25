module Annotations
  class Show < BaseUseCase
    attr_reader :annotation

    def initialize(id)
      super()
      @id = id
      @annotation = nil
    end

    def call
      @annotation = Annotation.find_by(id: @id)

      if @annotation.nil?
        add_error("Annotation not found")
      end

      self
    end
  end
end
