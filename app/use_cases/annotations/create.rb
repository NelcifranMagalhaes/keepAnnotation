module Annotations
  class Create < BaseUseCase
    attr_reader :annotation

    def initialize(params)
      super()
      @params = params
      @annotation = nil
    end

    def call
      @annotation = Annotation.new(@params)

      unless @annotation.valid?
        @annotation.errors.full_messages.each { |msg| add_error(msg) }
        return self
      end

      unless @annotation.save
        @annotation.errors.full_messages.each { |msg| add_error(msg) }
      end

      self
    end
  end
end
