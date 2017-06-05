require 'rails_helper'

RSpec.describe "user can edit a link url/title", :js => :true do
  scenario "edit link read status" do
    user = User.create(id: 1, email:"user@user.com", password:"password")
    link = user.links.create(url:"www.facebook.com", title:"facebook")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

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

  scenario "cannot edit with invalid url" do
    user = User.create(id: 1, email:"user@user.com", password:"password")
    link = user.links.create(url:"www.facebook.com", title:"facebook")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit '/links'

    expect(page).to have_content('Edit')

    click_button 'Edit'

    expect(current_path).to eq(edit_link_path(link))

    fill_in 'url', with: ''
    fill_in 'title', with: 'ESPN'
    click_button 'submit'

    expect(current_path).to eq(root_path)

    expect(page).to_not have_content('www.espn.com')
    expect(page).to_not have_content('ESPN')

    expect(page).to have_content("URL can't be blank")
  end

  scenario "cannot edit with invalid url" do
    user = User.create(id: 1, email:"user@user.com", password:"password")
    link = user.links.create(url:"www.facebook.com", title:"facebook")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit '/links'

    expect(page).to have_content('Edit')

    click_button 'Edit'

    expect(current_path).to eq(edit_link_path(link))

    fill_in 'url', with: 'espn'
    fill_in 'title', with: 'ESPN'
    click_button 'submit'

    expect(current_path).to eq(root_path)

    expect(page).to_not have_content('www.espn.com')
    expect(page).to_not have_content('ESPN')

    expect(page).to_not have_content("URL is an invalid URL")
  end

  scenario "cannot edit with invalid title" do
    user = User.create(id: 1, email:"user@user.com", password:"password")
    link = user.links.create(url:"www.facebook.com", title:"facebook")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit '/links'

    expect(page).to have_content('Edit')

    click_button 'Edit'

    expect(current_path).to eq(edit_link_path(link))

    fill_in 'url', with: 'www.espn.com'
    fill_in 'title', with: ''
    click_button 'submit'

    expect(current_path).to eq(root_path)

    expect(page).to_not have_content('www.espn.com')
    expect(page).to_not have_content('ESPN')

    expect(page).to_not have_content("Title can't be blank")
  end
end
