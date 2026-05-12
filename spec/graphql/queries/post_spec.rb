RSpec.describe "Post Query", type: :request do
  let(:user) { create(:user) } # lazy execution
  let!(:the_post) { create(:post, user: user) } # bang: executes immediately/ before

  let(:query) do
    %(
      query {
        getPosts {
          nodes {
            id
            title
            body
          }
        }
      }
    )
  end

  context "when authenticated" do
    it "returns all posts" do
      graphql_request(query, user: user)

      expect(response).to have_http_status(:ok)
      expect(graphql_errors).to be_nil
      expect(graphql_data["getPosts"]["nodes"]).not_to be_empty
    end
  end

  context "when not authenticated" do
    it "returns unauthorized error" do
      graphql_request(query)

      expect(response).to have_http_status(:unauthorized)
    end
  end
end
