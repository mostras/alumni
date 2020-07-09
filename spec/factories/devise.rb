require "factory_bot"

FactoryBot.define do

  factory :user do
    first_name {"Joe"}
    last_name {"Black"}
    email {"joe@gmail.com"}
    password {"azerty"}
  end

end
