class ApplicationError < GraphQL::ExecutionErr
  def initialize(msg = "Application Error")
    super
  end
end
