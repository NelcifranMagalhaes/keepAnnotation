module Annotations
  class Delete < BaseUseCase
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
        return self
      end

      unless @annotation.destroy
        add_error("Failed to delete annotation")
      end

      self
    end
  end
end
