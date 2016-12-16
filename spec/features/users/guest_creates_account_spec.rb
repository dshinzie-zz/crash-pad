require 'rails_helper'

describe "A not logged in user" do
  scenario "creates an account" do
    visit new_user_path

    fill_in 'Email', with: "johnnyquest@test.com"
    fill_in 'Password', with: "password"
    fill_in 'First Name', with: "Johnny"
    fill_in 'Last Name', with: "Quest"
    fill_in 'Phone Number', with: "999-999-9999"

    click_button "Create Account"

    expect(current_path).to eq(dashboard_path)
  end

  scenario "returns to form if account not valid" do
    visit new_user_path

    fill_in 'Email', with: "johnnyquest@test.com"
    fill_in 'Password', with: "password"
    fill_in 'Last Name', with: "Quest"
    fill_in 'Phone Number', with: "999-999-9999"

    click_button "Create Account"

    expect(current_path).to eq(new_user_path)
  end
end
