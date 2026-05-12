module RequestHelper
  def graphql_request(query:, variable: {}, user: nil)
    if user
      token = user.generate_token
      header["Authorization"] = "Bearer #{token}" # [] is a method called in the variable header, and Authorization is a key and bearer__ is a value
    end
    post "/graphql",
      params: { query: query, variable: variable }.to_json,
      header: header.merge { "content-type" => "application/json" } # string key value pair
  end

  def graphql_response
    JSON.parse(response.body)
  end
  def graphql_data
    graphql_response["data"]
  end

  def graphql_errors
    graphql_response["errors"]
  end
end
