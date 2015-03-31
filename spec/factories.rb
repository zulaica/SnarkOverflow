FactoryGirl.define do
  factory :user do
    email "ian@animorphs.gov"
    password "leet_dewd"
    password_confirmation "leet_dewd"
  end

  factory :question do
    user
    title "Alice College shared EB connection Darby"
    body "an outer space echoed right in this time. only runner specs the past because cant"
  end
end
