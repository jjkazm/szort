require "rails_helper"

RSpec.feature "Shortening url", js:true do
  scenario "succesfully directs to done page" do
    visit "/"
    fill_in "url[long]", with: "www.google.com"
    click_button "Shorten"
    expect(current_url).to have_content("done")
    expect(page).to have_content("google.com")
    expect(page).not_to have_content("www.google.com")
    new_window = window_opened_by { click_link "localhost" }
    within_window new_window do
      expect(current_url).to eq "https://www.google.com/"
    end
  end

  scenario "creates 8 character link" do
    visit "/"
    fill_in "url[long]", with: "www.google.com"
    click_button "Shorten"
    short_url = find_by_id("short")
    puts short_url.text.length
    expect(short_url.text.length - "http://localhost:3000/".length).to eq 8
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
