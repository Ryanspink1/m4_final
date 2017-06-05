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


    expect(page).to have_content('www.google.com')
    expect(page).to have_content('Google')
    expect(page).to have_content('false')
    expect(page).to have_content('Mark Read')

  end

  scenario "link will not be created if title is invalid" do
    user = User.create(id: 1, email:"user@user.com", password:"password")
    user.links.create(url:"www.facebook.com", title:"facebook")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit "/"

    fill_in 'Enter a URL', with: "www.google.com"
    fill_in 'Enter a Title', with: ''
    click_button("submit-new-link")

    expect(page).to have_content("Title can't be blank")
    expect(page).to_not have_content("www.google.com")
  end

  scenario "link will not be created if url is invalid" do
    user = User.create(id: 1, email:"user@user.com", password:"password")
    user.links.create(url:"www.facebook.com", title:"facebook")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit "/"

    fill_in 'Enter a URL', with: "google"
    fill_in 'Enter a Title', with: 'google'
    click_button("submit-new-link")

    expect(page).to have_content("URL is an invalid URL")
    expect(page).to_not have_content("google")
  end


end
