require "rails_helper"
require 'pry'

RSpec.describe "user can create new link", :js => :true do
  scenario "create new link" do
    user = User.create(id: 1, email:"user@user.com", password:"password")
    user.links.create(url:"www.facebook.com", title:"facebook")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit "/"

    fill_in 'Enter a URL', with: "www.google.com"
    fill_in 'Enter a Title', with: 'Google'
    click_button("submit-new-link")


    link = user.links
    # binding.pry


    expect(page).to have_content('www.google.com')
    expect(page).to have_content('Google')
    expect(page).to have_content('false')
    expect(page).to have_content('Mark Read')

  end
end
