require 'rails_helper'

describe "Visitor" do
  scenario "cannot see other user's page or information" do
    user = User.create(name: "Drew", email: "email@email", password: "password", role: 0)

    visit dashboard_path

    expect(page).to_not have_content(user.name)
    expect(page).to_not have_content(user.email)
    expect(page).to have_content("The page you were looking for doesn't exist.")
  end
end
