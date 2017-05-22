require 'rails_helper'

describe 'guests' do
  it 'can create a new account' do

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
end
