Feature: Event creation

  In order to make my friends known about an event I want to organize
  As a event organizer
  I want to create the event in the application
  
  Scenario: Event details
    
    Given I am on the homepage
    
    When I fill in "Your Email" with "dchelimsky@gmail.com"
    And I fill in "Event name" with "Monsters of Ruby III"
    And I fill in "Event location" with "Serrano 120, Madrid"
    And I fill in "October 22, 2009" as the "Event date 1" date
    And I click on "add another"
    And I fill in "October 29, 2009" as the "Event date 2" date
    And I press "Next"
    
    Then the following event should have been created:
    | email    | christos@me.com        |
    | name     | Monsters of Ruby III   |
    | location | Serrano 120, Madrid    |
    | dates    | 2009/10/22, 2009/10/29 |
    And I should be on the send form for the "Monsters of Ruby III" event
    
  Scenario: Wrong event data
    Given I am on the homepage   
    When I press "Next"
    Then I should be on the homepage
    And no event should have been created
    And I should see "FAIL! Event couldn't be created"
    And I should see "Email can't be blank"
    And I should see "Name can't be blank"
    And I should see "Event date 1 can't be blank"

  @advanced
  Scenario: Wrong event data
  
    Given pending # Remove me
   
    Given I am on the homepage
    When I fill in "Your Email" with "wadus@monstersofruby.com"
    Then I should see "Email doesn't exist"
    When I fill in "Event location" with "Serrano 937, Madrid"
    Then I should see "Location doesn't found"
    
    When I fill in "Event name" with "Monsters of Ruby III"
    And I select "October 22, 2009" as the "Event date 1" date
    And I press "Next"
    
    When I press "Next"
    Then I should be on the homepage
    And no event should have been created
    And I should see "Email doesn't exist"
    And I should see "Location not found"

  @advanced
  Scenario: Preview is shown while I type
  
    Given I am on the homepage
    
    When I fill in "Your Email" with "dchelimsky@gmail.com"
    And I fill in "Event name" with "Monsters of Ruby III"
    And I fill in "Event location" with "Serrano 120, Madrid"
    And I select "October 22, 2009" as the "Event date 1" date
    And I click on "add another"
    And I select "October 29, 2009" as the "Event date 2" date
    
    Then I should see preview of the message to be sent with the following content
    """
    Hi,
    christos@me.com has invited you to an event called "Monsters of Ruby III" to take place in "Serrano 120, Madrid" on one of the following dates:
    - Sat, 24th of October 2009
    - Sat, 31th of October 2009
    Please follow this link to select which of the dates you are available, if any:
    http://example.url
    """
    And I should see a map image of "Serrano 120, Madrid"
