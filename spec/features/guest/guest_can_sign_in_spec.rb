require 'rails_helper'

describe 'guests' do
  it 'can create an account sign in' do

    visit root_path

    click_link 'create-account-button'

    expect(current_path).to eq(new_user_path)

    fill_in 'email', with: "admin@admin.com"
    fill_in 'password', with: "password"
    fill_in 'password_confirmation', with: "password"

    click_button("Submit New Account")

    expect(current_path).to eq('/links')
    expect(page).to have_content('admin@admin.com')

    click_link("Sign Out")

    expect(current_path).to eq('/login')

    fill_in 'email', with: "admin@admin.com"
    fill_in 'password', with: "password"
    click_button("Login")

    expect(page).to have_content('admin@admin.com')
    expect(current_path).to eq('/links')

  end

  it 'cannot sign in with invalid credentials' do
    user = User.create(id: 1, email:"user@user.com", password:"password")
    link = user.links.create(url:"www.facebook.com", title:"Facebook", read:"true")
    link_two = user.links.create(url:"www.espn.com", title:"espn")
    link_three = user.links.create(url:"www.hamtime.com", title:"hamtime", read:"true")

    visit root_path
    expect(current_path).to eq('/login')

    fill_in 'email', with: "admin@admin.com"
    fill_in 'password', with: "password"
    click_button("Login")

    expect(page).to have_content('Invalid Credentials')
  end

  it 'cannot sign in with invalid credentials' do
    user = User.create(id: 1, email:"user@user.com", password:"password")
    link = user.links.create(url:"www.facebook.com", title:"Facebook", read:"true")
    link_two = user.links.create(url:"www.espn.com", title:"espn")
    link_three = user.links.create(url:"www.hamtime.com", title:"hamtime", read:"true")

    visit root_path
    expect(current_path).to eq('/login')

    fill_in 'email', with: "user@user.com"
    fill_in 'password', with: "pass"
    click_button("Login")

    expect(page).to have_content('Invalid Credentials')
  end
end
