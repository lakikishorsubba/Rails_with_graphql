# factory bot helps to create a pre-made object of sth that we can use directly, its the combo of faker.
# Faker: to randomly create the object attributes.
# Factory bot: takes faker attributes and creates objectg:
# Eg: faker creates user name and email atrribute, while factory bot takes this attribute and creates a user object.

FactoryBot.define do # call module class
  factory :user do  # name of factory and map to User model automatically
    email do
      Faker::Internet.email
    end # unique email is generated each time
    password do
      "Password@123"
    end # static password
  end
end
