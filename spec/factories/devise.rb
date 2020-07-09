require "factory_bot"

FactoryBot.define do

  factory :user do
    first_name {"Joe"}
    last_name {"Black"}
    email {"Joe@gmail.com"}
    password {"azerty"}
  end

end
