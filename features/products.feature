Feature: The product service manages products
    As an Administrator
    I need to be able to manage products in the catalog
    So that I can keep the catalog up to date

Background:
    Given the following products
        | name      | category | available | price | description             |
        | Hat       | CLOTHS   | true      | 12.50 | A red fedora            |
        | Shoes     | CLOTHS   | false     | 25.00 | A pair of black shoes   |
        | Big Mac   | FOOD     | true      | 5.00  | A large hamburger       |
        | Shorts    | CLOTHS   | true      | 10.00 | A pair of blue shorts   |

Scenario: Create a Product
    When I visit the "Home Page"
    And I set the "Name" to "T-Shirt"
    And I set the "Category" to "CLOTHS"
    And I set the "Available" to "true"
    And I set the "Price" to "10.00"
    And I set the "Description" to "A blue T-Shirt"
    And I press the "Create" button
    Then I should see the message "Success"
    And I should see "T-Shirt" in the results
    And I should not see "Fedora" in the results

Scenario: Read a Product
    When I visit the "Home Page"
    And I set the "Name" to "Hat"
    And I press the "Search" button
    Then I should see the message "Success"
    When I copy the "Id" field
    And I press the "Clear" button
    And I paste the "Id" field
    And I press the "Retrieve" button
    Then I should see the message "Success"
    And I should see "Hat" in the "Name" field
    And I should see "A red fedora" in the "Description" field
    And I should see "True" in the "Available" dropdown
    And I should see "CLOTHS" in the "Category" dropdown
    And I should see "12.50" in the "Price" field

Scenario: Update a Product
    When I visit the "Home Page"
    And I set the "Name" to "Hat"
    And I press the "Search" button
    Then I should see the message "Success"
    And I should see "A red fedora" in the "Description" field
    When I change "Description" to "Fedora"
    And I press the "Update" button
    Then I should see the message "Success"
    When I copy the "Id" field
    And I press the "Clear" button
    And I paste the "Id" field
    And I press the "Retrieve" button
    Then I should see the message "Success"
    And I should see "Fedora" in the "Description" field

Scenario: Delete a Product
    When I visit the "Home Page"
    And I set the "Name" to "Hat"
    And I press the "Search" button
    Then I should see the message "Success"
    When I copy the "Id" field
    And I press the "Clear" button
    And I paste the "Id" field
    And I press the "Delete" button
    Then I should see the message "Product has been Deleted!"
    When I press the "Clear" button
    And I press the "Search" button
    Then I should see the message "Success"
    And I should not see "Hat" in the results

Scenario: List all products
    When I visit the "Home Page"
    And I press the "Clear" button
    And I press the "Search" button
    Then I should see the message "Success"
    And I should see "Hat" in the results
    And I should see "Shoes" in the results
    And I should see "Big Mac" in the results
    And I should see "Shorts" in the results

Scenario: Search by category
    When I visit the "Home Page"
    And I press the "Clear" button
    And I select "FOOD" in the "Category" dropdown
    And I press the "Search" button
    Then I should see the message "Success"
    And I should see "Big Mac" in the results
    And I should not see "Hat" in the results
    And I should not see "Shoes" in the results
    And I should not see "Shorts" in the results

Scenario: Search by available
    When I visit the "Home Page"
    And I press the "Clear" button
    And I select "True" in the "Available" dropdown
    And I press the "Search" button
    Then I should see the message "Success"
    And I should see "Hat" in the results
    And I should see "Big Mac" in the results
    And I should not see "Shoes" in the results
    And I should see "Shorts" in the results

Scenario: Search by name
    When I visit the "Home Page"
    And I set the "Name" to "Hat"
    And I press the "Search" button
    Then I should see the message "Success"
    And I should see "Hat" in the "Name" field
    And I should see "A red fedora" in the "Description" field
