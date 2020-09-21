FactoryBot.define do
  factory :school_experience do
    title { "MyString" }
    start_time { "MyString" }
    end_time { "MyString" }
    location { "MyString" }
    current { false }
    user { nil }
    school { nil }
  end
end
