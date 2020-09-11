require "factory_bot"

FactoryBot.define do

  factory :user do
    first_name {"Joe"}
    last_name {"Black"}
    email {"Joe@gmail.com"}
    password {"azerty"}

    trait :looking_for_job do
      looking_for_job {true}
    end

    trait :company_hire do
      company_hire {true}
    end


    after(:build) { |user| user.class.skip_callback(:create, :after, :add_mail_to_google_sheet, raise: false) }
  end

end
