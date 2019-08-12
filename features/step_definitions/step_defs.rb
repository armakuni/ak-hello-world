Given("The app is deployed") do
end

When("I make a request to {string}") do |url|
  visit url
end

Then("I should receive {string}") do |string|
  expect(page).to have_content(string)
end
