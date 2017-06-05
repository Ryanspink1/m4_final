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
  end

  it 'cannot create a new account with an invalid email' do

    visit root_path

    click_link 'create-account-button'

    expect(current_path).to eq(new_user_path)

    fill_in 'email', with: ""
    fill_in 'password', with: "password"
    fill_in 'password_confirmation', with: "password"

    click_button("Submit New Account")

    expect(current_path).to eq(new_user_path)
    expect(page).to have_content("Email can't be blank")
  end

  it 'cannot create a new account with an invalid password' do

    visit root_path

    click_link 'create-account-button'

    expect(current_path).to eq(new_user_path)

    fill_in 'email', with: "admin@admin.com"
    fill_in 'password', with: ""
    fill_in 'password_confirmation', with: "password"

    click_button("Submit New Account")

    expect(current_path).to eq(new_user_path)
    expect(page).to have_content("Password can't be blank")
  end

  it 'cannot create a new account with an non-matching password confirmation' do

    visit root_path

    click_link 'create-account-button'

    expect(current_path).to eq(new_user_path)

    fill_in 'email', with: "admin@admin.com"
    fill_in 'password', with: "password"
    fill_in 'password_confirmation', with: "hello"

    click_button("Submit New Account")

    expect(current_path).to eq(new_user_path)
    expect(page).to have_content("Password confirmation doesn't match Password")
  end
end
