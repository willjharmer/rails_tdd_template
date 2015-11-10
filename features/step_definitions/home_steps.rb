When /^I go to the homepage$/ do
  @home_page = @app.home_page
  @home_page.load
end

Then /^I should see the homepage$/ do
  expect(@home_page).to be_displayed
end
