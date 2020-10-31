FactoryBot.define do
  factory :popup_message do
    message { "MyText" }
    link { "MyString" }
    link_title { "MyString" }
    user { nil }
  end
end
