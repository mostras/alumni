FactoryBot.define do
  factory :ghost do
    first_name { "MyString" }
    last_name { "MyString" }
    email { "MyString" }
    notification_send { false }
  end
end
