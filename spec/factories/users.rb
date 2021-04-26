FactoryBot.define do
  factory :user do
    email {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 6)
    password {password}
    password_confirmation {password}
    nickname              {Faker::Name.name}
    last_name             {"山田"}
    last_name_ruby        {"ヤマダ"}
    first_name            {"太郎"}
    first_name_ruby       {"タロウ"}
    birthdate             {"2000-01-01"}
  end
end