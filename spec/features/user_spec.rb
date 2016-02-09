require "rails_helper"

describe "Create a new user" do

  let(:user) { FactoryGirl.create(:user) }
  before { visit "/users/new" }

  it "shows a form for signing up" do
    expect(page).to have_css("form")
  end

  it "fills in form fields" do
    fill_in "user_first_name", with: "firstName"
    fill_in "user_last_name", with: "lastName"
    fill_in "user_userName", with: "usernameName"
    fill_in "user_email", with: "thisisanemail@emailthisis.net"
    fill_in "user_password", with: "1234abcd"
    click_button "Sign Up"

    expect(page.current_path).to match(/users\/usernamename/)
  end

end