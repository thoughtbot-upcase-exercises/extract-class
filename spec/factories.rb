FactoryGirl.define do
  sequence :email do |n|
    "user#{n}@example.com"
  end

  sequence :title do |n|
    "Survey #{n}"
  end

  factory :survey do
    title
    author factory: :user
  end

  factory :user, aliases: [:sender] do
    email
    first_name 'Ron'
    last_name 'Burgundy'
    password 'password'
  end
end
