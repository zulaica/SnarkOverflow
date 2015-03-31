def sign_in(user)
  visit new_session_path
  fill_in "Email", :with => user.email
  fill_in "Password", :with => user.password
  click_button "Login"
end

def create_question(question)
  visit root_path
  click_on "Ask a Question"
  fill_in "Title", :with => question.title
  fill_in "Body", :with => question.body
  click_on "Submit"
end
