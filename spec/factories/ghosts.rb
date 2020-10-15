FactoryBot.define do
  factory :ghost do
    first_name { "Joe" }
    last_name { "Dalton" }
    email { "joe@gmail.com" }
    notification_send { false }
  end

  trait :notification_send do
    notification_send { true }
  end

end
