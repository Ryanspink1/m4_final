require 'rails_helper'

RSpec.describe "user can filter links by url/title", :js => :true do
  scenario "filter link by url/title" do
    user = User.create(id: 1, email:"user@user.com", password:"password")
    link = user.links.create(url:"www.facebook.com", title:"Facebook")
    link_two = user.links.create(url:"www.espn.com", title:"espn")
    link_three = user.links.create(url:"www.hamtime.com", title:"hamtime")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit '/links'

    expect(current_path).to eq(edit_link_path(link))

    fill_in 'search', with:"facebook"

    expect(page).to have_content(link.title)
    expect(page).to have_content(link.url)

    expect(page).to_not have_content(link_two.title)
    expect(page).to_not have_content(link_two.url)
    expect(page).to_not have_content(link_three.title)
    expect(page).to_not have_content(link_three.url)
  end
end
