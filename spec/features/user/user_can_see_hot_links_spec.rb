require 'rails_helper'

describe 'user visits link index page' do
  it 'can see top link status of link' do

    user = User.create(id: 1, email:"user@user.com", password:"password")
    user.links.create(url:"www.facebook.com", title:"facebook")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit "/"

    click_on "Mark Read"

    expect(page).to have_content("TOP LINK")

  end
  it 'can see hot read status of link' do

    user = User.create(id: 1, email:"user@user.com", password:"password")
    user.links.create(url:"www.facebook.com", title:"facebook", read:"true")
    user.links.create(url:"www.google.com", title:"google")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit "/"
    expect(page).to have_content("TOP LINK")
    expect(page).to_not have_content("HOT")
    
    click_on "Mark Read"

    expect(page).to have_content("HOT")

  end
end
