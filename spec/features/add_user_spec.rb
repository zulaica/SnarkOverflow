require "rails_helper"

describe "The account creating and viewing process" do
  it "will allow user to be created", js: true do
    visit new_user_path
    fill_in "Email", :with => "user"
    fill_in "Password", :with => "password"
    fill_in "Password confirmation", :with => "password"
    click_on "Submit"
    expect(page).to have_content "Welcome"
  end
end
