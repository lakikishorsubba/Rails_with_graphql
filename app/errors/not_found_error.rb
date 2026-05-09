class NotFoundError < GraphQL::ExecutionError
  def initialize(msg = "Not found")
    super # passes msg UP to GraphQL::ExecutionError: child to parent
  end
end
