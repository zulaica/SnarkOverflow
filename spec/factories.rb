FactoryGirl.define do
  factory(:user) do
    email("ian@animorphs.gov")
    password("leet_dewd")
    password_confirmation("leet_dewd")
  end
end
