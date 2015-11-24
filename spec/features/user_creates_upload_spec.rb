require 'rails_helper'

feature "User creates upload" do 
  scenario "successfully" do 
    sign_in
    click_on "Upload File"
    fill_in "Title", with: "New Upload"
    click_on "Submit"

    expect(page).to have_css ".upload li", text: "New Upload"
  end
end
