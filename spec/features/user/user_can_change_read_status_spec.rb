require "rails_helper"
require 'pry'

RSpec.describe "user can edit a link read status", :js => :true do
  scenario "edit link read status" do
    user = User.create(id: 1, email:"user@user.com", password:"password")
    user.links.create(url:"www.facebook.com", title:"facebook")
    user.links.create(url:"www.facebook.com", title:"facebook", read:'true')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit '/links'

    expect(page).to have_content('Mark Read')
    expect(page).to have_content('Mark Unread')

    click_button 'Mark Read'

    expect(page).to_not have_content('Mark Read')


  end

  scenario "editing a read status changes styling" do
    user = User.create(id: 1, email:"user@user.com", password:"password")
    user.links.create(url:"www.facebook.com", title:"facebook")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit '/links'

    expect(page).to have_content('Mark Read')

    click_button 'Mark Read'

    expect(page).to_not have_content('Mark Read')

    within('.link-table-data') do
      expect(page).to have_css('background-color:red')
    end


  end
end
