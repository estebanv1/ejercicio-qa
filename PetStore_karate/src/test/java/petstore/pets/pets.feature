Feature: Pet management in the store

  Background:
    * url 'https://petstore.swagger.io/v2'
    * def petRequest = read('classpath:json/PetRequest.json')

  @PetCreation @200
  Scenario Outline: Pet creation and search by id

    * if (<petId>) petRequest.id = <petId>
    * if (<category>) petRequest.category = <category>
    * if ('<petName>' && '<petName>' != "null") petRequest.name = '<petName>'
    * if (<photoUrls>) petRequest.photoUrls = <photoUrls>
    * if (<tags>) petRequest.tags = <tags>
    * if ('<petStatus>' && '<petStatus>' != "null") petRequest.status = '<petStatus>'

    Given path 'pet'
    And request petRequest
    When method post
    Then status 200
    * if (petRequest.id == null) petId = response.id
    * if (petRequest.id == null) petRequest.id = response.id
    And if (petRequest.category != null && petRequest.category.id == null && petRequest.category.name != null) petRequest.category.id = response.category.id
    And match response == karate.toJson(petRequest, true)

    Given path 'pet/' + petId
    When method get
    Then status 200
    And match response == karate.toJson(petRequest, true)

    Examples:

      | petId      | category                          | petName                      | photoUrls                               | tags                                                                                              | petStatus   |
      | 11         | { "id": 1, "name": "Dog" }        | Lola                         | ["string","string2"]                    | [ { "id": 13, "name": "black" }, { "id": 16, "name": "white" } ]                                  | available   |
      | 21         | null                              | Zeus                         | []                                      | [ { "id": 3, "name": "small" }]                                                                   | pending     |
      | 112        | { "id": 1, "name": "Dog" }        | Ares                         | ["https://test.test/photos/photo1.jpg"] | [ { "id": 4, "name": "big" }, { "id": 17, "name": "orange" }, { "id": 54, "name": "fiendly" }  ]  | sold        |
      | null       | { "id": 2, "name": "Cat" }        | Maya                         | ["photourl1","photourl2","photourl3"]   | [ { "id": 13, "name": "black" }, { "id": 21, "name": "light brown" } ]                            | available   |
      | 1122334454 | { "id": 2, "name": null }         | Lulú                         | ["photourl1"]                           | [ { "id": 15, "name": "15test" }, { "id": 19, "name": "test19" } ]                                | pending     |
      | 1122334455 | { "id": null, "name": "Cat" }     | Mango                        | []                                      | [ { "id": 13, "name": "black" }, { "id": 16, "name": "white" } ]                                  | sold        |
      | 1122334456 | { "id": 3, "name": "Fish" }       | Oreo                         | ["photourl1","photourl2"]               | [ { "id": 13, "name": "black" }, { "id": 16, "name": "white" }, { "id": 25, "name": "brown" } ]   | null        |
      | 1122334457 | { "id": 3, "name": "Fish" }       | Very very very long pet name | ["String"]                              | null                                                                                              | pending     |
      | 1122334458 | { "id": 17, "name": "test,{([ñ" } | Alaska                       | ["1","2","3","4","5","6","7","8","9"]   | []                                                                                                | sold        |
      | 1122334459 | { "id": 81, "name": "Bird" }      | jordi                        | null                                    | [ { "id": 1575, "name": "test-tag" } ]                                                            | available   |


  @PetCreation
  Scenario Outline: Failed pet creation

    * if (<petId>) petRequest.id = <petId>
    * if ('<petName>' && '<petName>' != "null") petRequest.name = '<petName>'
    * if ('<petStatus>' && '<petStatus>' != "null") petRequest.status = '<petStatus>'

    Given path 'pet'
    And request petRequest
    When method post
    Then status 400
    And response.message == message

    Examples:

      | petId                 | category                                        | petName     | photoUrls                               | tags                                                                                              | petStatus   | message                          |
      | 11                    | { "id": 1, "name": "Dog" }                      | Lola        | ["string","string2"]                    | [ { "id": 13, "name": "black" }, { "id": 16, "name": "white" } ]                                  | available   | Id is already in use             |
      | 1122334461            | { "id": 1, "name": "Dog" }                      | null        | ["string","string2"]                    | [ { "id": 13, "name": "black" }, { "id": 16, "name": "white" } ]                                  | available   | The field name is mandatory      |
      | 1122334462            | null                                            | Zeus        | null                                    | [ { "id": 3, "name": "small" }]                                                                   | pending     | The field photoUrls is mandatory |
      | 92233720368547758071  | { "id": 1, "name": "Dog" }                      | Ares        | ["https://test.test/photos/photo1.jpg"] | [ { "id": 4, "name": "big" }, { "id": 17, "name": "orange" }, { "id": 54, "name": "fiendly" }  ]  | sold        | Id must be int64                 |
      | 1122334464            | { "id": 92233720368547758071, "name": "Cat" }   | Maya        | ["photourl1","photourl2","photourl3"]   | [ { "id": 13, "name": "black" }, { "id": 21, "name": "light brown" } ]                            | available   | Category id must be int64        |
      | "1122334465"          | { "id": 2, "name": null }                       | Lulú        | ["photourl1"]                           | [ { "id": 15, "name": "15test" }, { "id": 19, "name": "test19" } ]                                | pending     | Bad id value                     |
      | 1122334466            | { "id": null, "name": "Cat" }                   | Mango       | []                                      | [ { "id": 13, "name": "black" }, { "id": 16, "name": "white" } ]                                  | test        | Bad status value                 |


  @PetUpdate @200
  Scenario Outline: Pet name and status update

    * if (<petId>) petRequest.id = <petId>
    * if (<category>) petRequest.category = <category>
    * if ('<petName>' && '<petName>' != "null") petRequest.name = '<petName>'
    * if (<photoUrls>) petRequest.photoUrls = <photoUrls>
    * if (<tags>) petRequest.tags = <tags>
    * if ('<petStatus>' && '<petStatus>' != "null") petRequest.status = '<petStatus>'
    * if (petRequest.id == null) petRequest.id = autoId
    * if (petRequest.category != null && petRequest.category.id == null && petRequest.category.name != null) petRequest.category.id = autoCategoryId

    Given path 'pet'
    And request petRequest
    When method put
    Then status 200
    And match response == karate.toJson(petRequest, true)

    Examples:

      | petId      | category                          | petName                      | photoUrls                               | tags                                                                                              | petStatus   |
      | 11         | { "id": 1, "name": "Dog" }        | new Lola                     | ["string","string2"]                    | [ { "id": 13, "name": "black" }, { "id": 16, "name": "white" } ]                                  | sold        |
      | 21         | null                              | Very very very long pet name | []                                      | [ { "id": 3, "name": "small" }]                                                                   | sold        |
      | 112        | { "id": 1, "name": "Dog" }        | Ares                         | ["https://test.test/photos/photo1.jpg"] | [ { "id": 4, "name": "big" }, { "id": 17, "name": "orange" }, { "id": 54, "name": "fiendly" }  ]  | sold        |
      | 1122334454 | { "id": 2, "name": null }         | Maya                         | ["photourl1"]                           | [ { "id": 15, "name": "15test" }, { "id": 19, "name": "test19" } ]                                | sold        |
      | 1122334456 | { "id": 3, "name": "Fish" }       | nemo                         | ["photourl1","photourl2"]               | [ { "id": 13, "name": "black" }, { "id": 16, "name": "white" }, { "id": 25, "name": "brown" } ]   | sold        |
      | 1122334457 | { "id": 3, "name": "Fish" }       | Vodka                        | ["String"]                              | null                                                                                              | sold        |
      | 1122334458 | { "id": 17, "name": "test,{([ñ" } | Florida                      | ["1","2","3","4","5","6","7","8","9"]   | []                                                                                                | sold        |
      | 1122334459 | { "id": 81, "name": "Bird" }      | jordi-dog                    | null                                    | [ { "id": 1575, "name": "test-tag" } ]                                                            | sold        |


  @PetSearchByStatus @200
  Scenario Outline: Pet search by status

    * if (<petId>) petRequest.id = <petId>
    * if (<category>) petRequest.category = <category>
    * if ('<petName>' && '<petName>' != "null") petRequest.name = '<petName>'
    * if (<photoUrls>) petRequest.photoUrls = <photoUrls>
    * if (<tags>) petRequest.tags = <tags>
    * if ('<petStatus>' && '<petStatus>' != "null") petRequest.status = '<petStatus>'
    * if (petRequest.id == null) petRequest.id = autoId
    * if (petRequest.category != null && petRequest.category.id == null && petRequest.category.name != null) petRequest.category.id = autoCategoryId

    Given path 'pet/findByStatus'
    And param status = petStatus
    When method get
    Then status 200
    And match response contains karate.toJson(petRequest, true)

    Examples:

      | petId      | category                          | petName                      | photoUrls                               | tags                                                                                              | petStatus   |
      | 11         | { "id": 1, "name": "Dog" }        | new Lola                     | ["string","string2"]                    | [ { "id": 13, "name": "black" }, { "id": 16, "name": "white" } ]                                  | sold        |
      | 21         | null                              | Very very very long pet name | []                                      | [ { "id": 3, "name": "small" }]                                                                   | sold        |
      | 112        | { "id": 1, "name": "Dog" }        | Ares                         | ["https://test.test/photos/photo1.jpg"] | [ { "id": 4, "name": "big" }, { "id": 17, "name": "orange" }, { "id": 54, "name": "fiendly" }  ]  | sold        |
      | 1122334454 | { "id": 2, "name": null }         | Maya                         | ["photourl1"]                           | [ { "id": 15, "name": "15test" }, { "id": 19, "name": "test19" } ]                                | sold        |
      | 1122334456 | { "id": 3, "name": "Fish" }       | nemo                         | ["photourl1","photourl2"]               | [ { "id": 13, "name": "black" }, { "id": 16, "name": "white" }, { "id": 25, "name": "brown" } ]   | sold        |
      | 1122334457 | { "id": 3, "name": "Fish" }       | Vodka                        | ["String"]                              | null                                                                                              | sold        |
      | 1122334458 | { "id": 17, "name": "test,{([ñ" } | Florida                      | ["1","2","3","4","5","6","7","8","9"]   | []                                                                                                | sold        |
      | 1122334459 | { "id": 81, "name": "Bird" }      | jordi-dog                    | null                                    | [ { "id": 1575, "name": "test-tag" } ]                                                            | sold        |


  @PetSearchByStatus @200
  Scenario Outline: Search for pets by incorrect status

    * if (<petId>) petRequest.id = <petId>
    * if (<category>) petRequest.category = <category>
    * if ('<petName>' && '<petName>' != "null") petRequest.name = '<petName>'
    * if (<photoUrls>) petRequest.photoUrls = <photoUrls>
    * if (<tags>) petRequest.tags = <tags>
    * if ('<petStatus>' && '<petStatus>' != "null") petRequest.status = '<petStatus>'
    * if (petRequest.id == null) petRequest.id = autoId
    * if (petRequest.category != null && petRequest.category.id == null && petRequest.category.name != null) petRequest.category.id = autoCategoryId

    Given path 'pet/findByStatus'
    And param status = petStatus
    When method get
    Then status 200
    And match response !contains karate.toJson(petRequest, true)

    Examples:

      | petId      | category                          | petName                      | photoUrls                               | tags                                                                                              | petStatus   |
      | 11         | { "id": 1, "name": "Dog" }        | new Lola                     | ["string","string2"]                    | [ { "id": 13, "name": "black" }, { "id": 16, "name": "white" } ]                                  | test        |
      | 21         | null                              | Very very very long pet name | []                                      | [ { "id": 3, "name": "small" }]                                                                   | available   |
      | 112        | { "id": 1, "name": "Dog" }        | Ares                         | ["https://test.test/photos/photo1.jpg"] | [ { "id": 4, "name": "big" }, { "id": 17, "name": "orange" }, { "id": 54, "name": "fiendly" }  ]  | pending     |
