FactoryBot.define do
  factory :work_experience do
    title { "MyString" }
    start_time { "MyString" }
    end_time { "MyString" }
    location { "MyString" }
    current { false }
    user { nil }
    company { nil }
  end
end
