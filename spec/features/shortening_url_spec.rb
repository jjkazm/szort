require "rails_helper"

RSpec.feature "Shortening url" do

  scenario "is succesfull" do
    visit "/"
    fill_in "url[long]", with: "www.google.com"
    click_button "Shorten"
    expect(page).to have_content("google.com")
    expect(page).not_to have_content("www.google.com")
  end

  scenario "fails with empty url provided" do
    visit "/"
    fill_in "url[long]", with: ""
    click_button "Shorten"
    expect(page).to have_content("Website url can't be blank")
    expect(page).to have_content("Website url is too short (minimum is 4 characters)")
    expect(page).to have_content("Website url is invalid")
  end
end
