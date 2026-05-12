RSpec.describe(User, type: :model) do # just for redable
  # rspec test cases goes here
  it "user to be valid" do
    user = create(:user)
    expect(user).to be_valid # does user.valid?
  end
end
