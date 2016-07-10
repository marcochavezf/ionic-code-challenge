Given(/^I open the ionic app$/) do
  wait_for_element_exists("SystemWebView")
  element = query("SystemWebView css:'div.title'").first
  fail(msg="No app found!") unless element["textContent"] == "Geolocation"
end

Given(/^I set my location to "([^"]*)" and "([^"]*)"$/) do |latitude, longitude|
  set_gps_coordinates(latitude, longitude)
end

Then(/^I should see Lat: as "([^"]*)"$/) do |latitude|
  wait_for_element_exists("SystemWebView css:'h1.ng-binding'")
  app_lat = query("SystemWebView css:'h1.ng-binding'").first["textContent"]

  fail(msg="Wrong latitude") unless "Lat: " + latitude == app_lat
end

Then(/^I should see Lng: as "([^"]*)"$/) do |longitude|
wait_for_element_exists("SystemWebView css:'h1.ng-binding'")
app_lng = query("SystemWebView css:'h1.ng-binding'").last["textContent"]

fail(msg="Wrong longitude") unless "Lng: " + longitude == app_lng
end

When(/^I select the Update position button$/) do
  touch(query("SystemWebView css:'button' {textContent CONTAINS 'Update position'}"))
end

When(/^I select the menu$/) do
  touch(query("SystemWebView css:'button'").first)
end

Then(/^I should see a Geolocation menu option$/) do
  wait_for_element_exists("SystemWebView css:'ion-item' {textContent CONTAINS 'Geolocation'}")
end

When(/^I select the Geolocation menu option$/) do
  touch("SystemWebView css:'ion-item' {textContent CONTAINS 'Geolocation'}")
end

Then(/^I should see the ionic app main page$/) do
  step "I open the ionic app"
end
