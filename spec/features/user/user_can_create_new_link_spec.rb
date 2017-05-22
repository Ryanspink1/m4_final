require "rails_helper"

RSpec.describe "user can create new link", :js => :true do
  scenario "create new link" do
    user = User.create(email:"user@user.com", password:"password")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit "/"

    fill_in 'Enter a URL', with: "www.google.com"
    fill_in 'Enter a Title', with: 'Google'
    click_button("submit-new-link")

    expect(page).to have_content('www.google.com')
    expect(page).to have_content('Google')
    expect(page).to have_content('false')
    expect(page).to have_content('Mark As Read')


  end
end
