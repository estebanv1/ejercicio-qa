Feature: Pet management in the store

  Background:
    * url 'https://petstore.swagger.io/v2'
    * def petRequest = read('classpath:json/PetRequest.json')

  @PetCreation
  Scenario Outline: petRequest creation

    Given path 'pet'
    And petRequest.id = <petId>
    And petRequest.category.id = <categoryId>
    And petRequest.category.name = '<categoryName>'
    And petRequest.name = '<petName>'
    And petRequest.photoUrls = <photoUrls>
    And petRequest.tags = <tags>
    And petRequest.status = '<petStatus>'
    And request petRequest
    When method post
    Then status 200
    And match response == petRequest

  Examples:

    | petId      | categoryId | categoryName | petName                      | photoUrls                               | tags                                                                                              | petStatus   |
    | 11         | 1          | Dog          | Lola                         | ["string","string2"]                    | [ { "id": 13, "name": "black" }, { "id": 16, "name": "white" } ]                                  | available   |
    | 21         | 1          | Dog          | Zeus                         | []                                      | [ { "id": 3, "name": "small" }]                                                                   | pending     |
    | 112        | 1          | Dog          | Ares                         | ["https://test.test/photos/photo1.jpg"] | [ { "id": 4, "name": "big" }, { "id": 17, "name": "orange" }, { "id": 54, "name": "fiendly" }  ]  | sold        |
    | 1122334453 | 2          | Cat          | Maya                         | ["photourl1","photourl2","photourl3"]   | [ { "id": 13, "name": "black" }, { "id": 21, "name": "light brown" } ]                            | available   |
    | 1122334454 | 2          | Cat          | Lulú                         | ["photourl1"]                           | [ { "id": 15, "name": "15test" }, { "id": 19, "name": "test19" } ]                                | pending     |
    | 1122334455 | 2          | Cat          | Mango                        | []                                      | [ { "id": 13, "name": "black" }, { "id": 16, "name": "white" } ]                                  | sold        |
    | 1122334456 | 3          | Fish         | Oreo                         | ["photourl1","photourl2"]               | [ { "id": 13, "name": "black" }, { "id": 16, "name": "white" }, { "id": 25, "name": "brown" } ]   | available   |
    | 1122334457 | 3          | Fish         | Very very very long pet name | ["String"]                              | []                                                                                                | pending     |
    | 1122334458 | 17         | test,{([ñ    | Alaska                       | ["1","2","3","4","5","6","7","8","9"]   | []                                                                                                | sold        |
    | 1122334459 | 81         | Dog          | jordi                        | []                                      | [ { "id": 1575, "name": "test-tag" } ]                                                            | available   |

  @PetSearchById
  Scenario Outline: petRequest search by id

    Given path 'pet/' + petId
    And petRequest.id = <petId>
    And petRequest.category.id = <categoryId>
    And petRequest.category.name = '<categoryName>'
    And petRequest.name = '<petName>'
    And petRequest.photoUrls = <photoUrls>
    And petRequest.tags = <tags>
    And petRequest.status = '<petStatus>'
    When method get
    Then status 200
    And match response == petRequest

  Examples:

    | petId      | categoryId | categoryName | petName                      | photoUrls                               | tags                                                                                              | petStatus   |
    | 11         | 1          | Dog          | Lola                         | ["string","string2"]                    | [ { "id": 13, "name": "black" }, { "id": 16, "name": "white" } ]                                  | available   |
    | 21         | 1          | Dog          | Zeus                         | []                                      | [ { "id": 3, "name": "small" }]                                                                   | pending     |
    | 112        | 1          | Dog          | Ares                         | ["https://test.test/photos/photo1.jpg"] | [ { "id": 4, "name": "big" }, { "id": 17, "name": "orange" }, { "id": 54, "name": "fiendly" }  ]  | sold        |
    | 1122334453 | 2          | Cat          | Maya                         | ["photourl1","photourl2","photourl3"]   | [ { "id": 13, "name": "black" }, { "id": 21, "name": "light brown" } ]                            | available   |
    | 1122334454 | 2          | Cat          | Lulú                         | ["photourl1"]                           | [ { "id": 15, "name": "15test" }, { "id": 19, "name": "test19" } ]                                | pending     |
    | 1122334455 | 2          | Cat          | Mango                        | []                                      | [ { "id": 13, "name": "black" }, { "id": 16, "name": "white" } ]                                  | sold        |
    | 1122334456 | 3          | Fish         | Oreo                         | ["photourl1","photourl2"]               | [ { "id": 13, "name": "black" }, { "id": 16, "name": "white" }, { "id": 25, "name": "brown" } ]   | available   |
    | 1122334457 | 3          | Fish         | Very very very long pet name | ["String"]                              | []                                                                                                | pending     |
    | 1122334458 | 17         | test,{([ñ    | Alaska                       | ["1","2","3","4","5","6","7","8","9"]   | []                                                                                                | sold        |
    | 1122334459 | 81         | Dog          | jordi                        | []                                      | [ { "id": 1575, "name": "test-tag" } ]                                                            | available   |

  @PetUpdate
  Scenario Outline: petRequest name and status update

    Given path 'pet'
    And petRequest.id = <petId>
    And petRequest.category.id = <categoryId>
    And petRequest.category.name = '<categoryName>'
    And petRequest.name = '<petName>'
    And petRequest.photoUrls = <photoUrls>
    And petRequest.tags = <tags>
    And petRequest.status = '<petStatus>'
    And request petRequest
    When method put
    Then status 200
    And match response == petRequest

  Examples:

    | petId      | categoryId | categoryName | petName                      | photoUrls                               | tags                                                                                              | petStatus   |
    | 11         | 1          | Dog          | new Lola                     | ["string","string2"]                    | [ { "id": 13, "name": "black" }, { "id": 16, "name": "white" } ]                                  | sold        |
    | 21         | 1          | Dog          | Very very very long pet name | []                                      | [ { "id": 3, "name": "small" }]                                                                   | sold        |
    | 112        | 1          | Dog          | Ares                         | ["https://test.test/photos/photo1.jpg"] | [ { "id": 4, "name": "big" }, { "id": 17, "name": "orange" }, { "id": 54, "name": "fiendly" }  ]  | sold        |
    | 1122334453 | 2          | Cat          | Lulú                         | ["photourl1","photourl2","photourl3"]   | [ { "id": 13, "name": "black" }, { "id": 21, "name": "light brown" } ]                            | sold        |
    | 1122334454 | 2          | Cat          | Maya                         | ["photourl1"]                           | [ { "id": 15, "name": "15test" }, { "id": 19, "name": "test19" } ]                                | sold        |
    | 1122334455 | 2          | Cat          | sold mango                   | []                                      | [ { "id": 13, "name": "black" }, { "id": 16, "name": "white" } ]                                  | sold        |
    | 1122334456 | 3          | Fish         | nemo                         | ["photourl1","photourl2"]               | [ { "id": 13, "name": "black" }, { "id": 16, "name": "white" }, { "id": 25, "name": "brown" } ]   | sold        |
    | 1122334457 | 3          | Fish         | Vodka                        | ["String"]                              | []                                                                                                | sold        |
    | 1122334458 | 17         | test,{([ñ    | Florida                      | ["1","2","3","4","5","6","7","8","9"]   | []                                                                                                | sold        |
    | 1122334459 | 81         | Dog          | jordi-dog                    | []                                      | [ { "id": 1575, "name": "test-tag" } ]                                                            | sold        |

  @PetSearchByStatus
  Scenario Outline: petRequest search by status

    Given path 'pet/findByStatus'
    And param status = petStatus
    And petRequest.id = <petId>
    And petRequest.category.id = <categoryId>
    And petRequest.category.name = '<categoryName>'
    And petRequest.name = '<petName>'
    And petRequest.photoUrls = <photoUrls>
    And petRequest.tags = <tags>
    And petRequest.status = '<petStatus>'
    When method get
    Then status 200
    And match response contains petRequest

  Examples:

    | petId      | categoryId | categoryName | petName                      | photoUrls                               | tags                                                                                              | petStatus   |
    | 11         | 1          | Dog          | new Lola                     | ["string","string2"]                    | [ { "id": 13, "name": "black" }, { "id": 16, "name": "white" } ]                                  | sold        |
    | 21         | 1          | Dog          | Very very very long pet name | []                                      | [ { "id": 3, "name": "small" }]                                                                   | sold        |
    | 112        | 1          | Dog          | Ares                         | ["https://test.test/photos/photo1.jpg"] | [ { "id": 4, "name": "big" }, { "id": 17, "name": "orange" }, { "id": 54, "name": "fiendly" }  ]  | sold        |
    | 1122334453 | 2          | Cat          | Lulú                         | ["photourl1","photourl2","photourl3"]   | [ { "id": 13, "name": "black" }, { "id": 21, "name": "light brown" } ]                            | sold        |
    | 1122334454 | 2          | Cat          | Maya                         | ["photourl1"]                           | [ { "id": 15, "name": "15test" }, { "id": 19, "name": "test19" } ]                                | sold        |
    | 1122334455 | 2          | Cat          | sold mango                   | []                                      | [ { "id": 13, "name": "black" }, { "id": 16, "name": "white" } ]                                  | sold        |
    | 1122334456 | 3          | Fish         | nemo                         | ["photourl1","photourl2"]               | [ { "id": 13, "name": "black" }, { "id": 16, "name": "white" }, { "id": 25, "name": "brown" } ]   | sold        |
    | 1122334457 | 3          | Fish         | Vodka                        | ["String"]                              | []                                                                                                | sold        |
    | 1122334458 | 17         | test,{([ñ    | Florida                      | ["1","2","3","4","5","6","7","8","9"]   | []                                                                                                | sold        |
    | 1122334459 | 81         | Dog          | jordi-dog                    | []                                      | [ { "id": 1575, "name": "test-tag" } ]                                                            | sold        |
