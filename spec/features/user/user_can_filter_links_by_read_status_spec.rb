require 'rails_helper'

RSpec.describe "user can filter links by read status", :js => :true do
  scenario "filter by link read status" do
    user = User.create(id: 1, email:"user@user.com", password:"password")
    link = user.links.create(url:"www.facebook.com", title:"Facebook", read:"true")
    link_two = user.links.create(url:"www.espn.com", title:"espn")
    link_three = user.links.create(url:"www.hamtime.com", title:"hamtime", read:"true")

    visit '/links'

    expect(current_path).to eq(edit_link_path(link))

    click_button("Show Read")

    within('#links-table') do
      expect(page).to have_content(link.title)
      expect(page).to have_content(link.url)

      expect(page).to have_content(link_three.title)
      expect(page).to have_content(link_three.url)

      expect(page).to_not have_content(link_two.title)
      expect(page).to_not have_content(link_two.url)
    end

    click_button("Show Unread")

    within('#links-table') do
      expect(page).to_not have_content(link.title)
      expect(page).to_not have_content(link.url)

      expect(page).to_not have_content(link_three.title)
      expect(page).to_not have_content(link_three.url)

      expect(page).to have_content(link_two.title)
      expect(page).to have_content(link_two.url)
    end
  end
end
