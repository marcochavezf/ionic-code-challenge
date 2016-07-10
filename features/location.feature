Feature: Geolocation Ionic App - Get GPS Coordinates
# As a user I want to see my location coordinates on my Ionic app so I can
# know my exact location.

  Scenario: Get coordinates for location
  # This scenario validates that the app gets the correct coordinates
    Given I set my location to "40.7141667" and "-74.0063889"
    When I open the ionic app
    Then I should see Lat: as "40.7141667"
    And I should see Lng: as "-74.0063889"

  Scenario Outline: Change coordinates
  # This scenario validates that a change of coordinates is reflecte on the app
    Given I open the ionic app
    And I set my location to "<latitude>" and "<longitude>"
    When I select the Update position button
    Then I should see Lat: as "<latitude>"
    And I should see Lng: as "<longitude>"
    Examples:
    |latitude   |longitude   |
    |40.7141667 |-74.0063889 |
    |34.0522222 |-118.2427778|
    |51.5       |-0.116667   |

  Scenario: Hamburger menu
  # This scenario validates that the hamburger menu contains the correct options
    Given I open the ionic app
    When I select the menu
    Then I should see a Geolocation menu option
    When I select the Geolocation menu option
    Then I should see the ionic app main page
