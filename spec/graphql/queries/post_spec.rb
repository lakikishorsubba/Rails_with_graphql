RSpec.describe "Post Query", type: :request do
  let(:user) do # more redable, lazy: runs when only user is called
    create(:user)
  end

  # let!(:post) { create(:post, user: user) }
  let!(:post) do # bang, executes immediately
    create(:post, user: user)
  end

  let(:query) do
    # percentile to return with multiline \n
    %(
      query{
        getPost{
          nodes{
            id
            title
            body
          }
        }
      }
    )
  end
 context("when authenticated") do # group similar test context
  it("returns all post") do
    request_post(:post, user: :user)
    expect(response).to_have_http_statys(:ok)
    data = JSON.parse(response.body)
    expect(data["data"]["getPosts"]["nodes"].size).to eq(1)
  end
 end
end
