module Annotations
  class Update < BaseUseCase
    attr_reader :annotation

    def initialize(id, params)
      super()
      @id = id
      @params = params
      @annotation = nil
    end

    def call
      @annotation = Annotation.find_by(id: @id)

      if @annotation.nil?
        add_error("Annotation not found")
        return self
      end

      unless @annotation.update(@params)
        @annotation.errors.full_messages.each { |msg| add_error(msg) }
      end

      self
    end
  end
end
