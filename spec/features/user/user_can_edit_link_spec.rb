require 'rails_helper'

RSpec.describe "user can edit a link url/title", :js => :true do
  scenario "edit link read status" do
    user = User.create(id: 1, email:"user@user.com", password:"password")
    link = user.links.create(url:"www.facebook.com", title:"facebook")


    visit '/links'

    expect(page).to have_content('Edit')

    click_button 'Edit'

    expect(current_path).to eq(edit_link_path(link))

    fill_in 'url', with: 'www.espn.com'
    fill_in 'title', with: 'ESPN'
    click_button 'submit'

    expect(current_path).to eq(root_path)

    expect(page).to have_content('www.espn.com')
    expect(page).to have_content('ESPN')
  end
end
