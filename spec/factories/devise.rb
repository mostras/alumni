require "factory_bot"

FactoryBot.define do

  factory :user do
    first_name {"Joe"}
    last_name {"Black"}
    email {"Joe@gmail.com"}
    password {"azerty"}
    phone_number { "0679093818" }
    whatsapp_number { "0679093818" }
    linkedin_url { "https://www.linkedin.com/in/adrien-barbier-5b479598/" }

    trait :looking_for_job do
      looking_for_job { true }
    end

    trait :company_hire do
      company_hire { true }
    end

    trait :looking_for_internship do
      looking_for_internship { true }
    end

    trait :admin do
      admin { true }
    end

    trait :parsing do
      parsing { true }
    end

    trait :automatic_updating do
      automatic_updating { true }
    end

    trait :manual_updating do
      manual_updating { true }
    end

    trait :on_google_sheet do
      on_google_sheet { true }
    end


    # after(:build) { |user| user.class.skip_callback(:create, :after, :add_mail_to_google_sheet, raise: false) }
  end

end
