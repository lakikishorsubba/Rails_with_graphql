class UnauthorizedError < GraphQL::ExecutionError
  def initialize(msg = "Unauthorized")
    super
  end
end
