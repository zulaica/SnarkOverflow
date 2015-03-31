require "rails_helper"

  describe "Viewing of specific questions process, using ajax" do
    let(:user) { FactoryGirl.create(:user) }
    let(:question) { FactoryGirl.create(:question) }

    before do
      visit new_session_path
      fill_in "Email", :with => user.email
      fill_in "Password", :with => user.password
      click_button "Login"
    end

    it "will populate a specific question, hiding previous content", js: true do
      visit root_path
      click_on "Alice College shared EB connection Darby"
      expect.(page).to have_content "an outer space echoed right in this time. only runner specs the past because cant"
    end
  end
