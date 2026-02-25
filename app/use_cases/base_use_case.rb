class BaseUseCase
  attr_reader :errors

  def initialize
    @errors = []
  end

  def call
    raise NotImplementedError, "Subclasses must implement #call"
  end

  def success?
    @errors.empty?
  end

  def failure?
    !success?
  end

  protected

  def add_error(message)
    @errors << message
  end
end
