Feature: Make a purchase on demoblaze website

  Scenario Outline: Add two items to the shopping cart
    Given that Esteban wants to make a purchase on the demoblaze site
    When he adds the <firstItem> from the <firstSection> section to the cart
    And he adds the <secondItem> from the <secondSection> section to the cart
    And he sees the products in the shopping cart
      | firstItem   | secondItem   |
      | <firstItem> | <secondItem> |
    And he completes the purchase form
      | name   | country   | city   | creditCard   | month   | year   |
      | <name> | <country> | <city> | <creditCard> | <month> | <year> |
    Then he sees the confirmation message
      | name   | country   | city   | creditCard   | month   | year   |
      | <name> | <country> | <city> | <creditCard> | <month> | <year> |

  Examples:

    | firstItem         | firstSection  | secondItem          | secondSection | name                                          | country   | city     | creditCard       | month   | year   |
    | Samsung galaxy s6 | Phones        | Sony vaio i5        | Laptops       | Esteban                                       | Colombia  | Medellín | 1122334455667788 | 7       | 2026   |
    | Nokia lumia 1520  | Phones        | ASUS Full HD        | Monitors      | Test                                          | Colombia  |          | 1234561234561234 | 7       | 2026   |
    | MacBook Pro       | Laptops       | Apple monitor 24    | Monitors      | This is a very very very very very long name  |           | Medellín | 111111111        | 7       |        |
    | MacBook air       | Laptops       | Sony vaio i7        | Laptops       | Esteban                                       | Colombia  | Bogotá   | 4321432143214321 |         | 2026   |
    | Nexus 6           | Phones        | Samsung galaxy s6   | Phones        | Esteban                                       | Colombia  | Medellín | 9999888877776666 | 7       | 2026   |
    | Dell i7 8gb       | Laptops       | 2017 Dell 15.6 Inch | Laptops       | Andrés                                        |           | Medellín | 97532            | 7       |        |
    | Apple monitor 24  | Monitors      | ASUS Full HD        | Monitors      | Esteban                                       | Colombia  |          | 1234567812345678 |         | 2026   |
    | MacBook air       | Laptops       | HTC One M9          | Phones        | Test name                                     |           |          | 1234567887654321 | 7       | 2026   |
    | Nokia lumia 1520  | Phones        | Dell i7 8gb         | Laptops       | Esteban                                       | Colombia  | Medellín | 1122334455667788 | 7       | 2026   |
    | ASUS Full HD      | Monitors      | Sony xperia z5      | Phones        | nameless                                      | Colombia  | Medellín | 1122112211221122 | 7       | 2026   |
    | MacBook Pro       | Laptops       | MacBook Pro         | Laptops       | Esteban                                       |           | Medellín | 1122334455667788 |         |        |
    | Iphone 6 32gb     | Phones        | Samsung galaxy s7   | Phones        | Esteban                                       |           | Medellín | 123              | 7       | 2026   |
