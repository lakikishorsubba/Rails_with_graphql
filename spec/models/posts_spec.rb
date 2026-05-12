require 'rails_helper'

RSpec.describe Post, type: :model do
  it "post to be valid" do
    post  = create(:post)
    expect(post).to be_valid
  end

  it("is invalid without user") do
    post = build(:post, user: nil)
    expect(post).not_to be_valid
  end

  it("post can be published") do
    post = create(:post, status: :published)
    expect(post.status).to eq("published")
  end
end
