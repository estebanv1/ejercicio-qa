package petstore.pets;

import com.intuit.karate.junit5.Karate;

public class PetsRunner {

    @Karate.Test
    Karate petsRunner() {
        return Karate.run("classpath:petstore/pets/pets.feature")//.tags("@PetCreation")
        ;
    }
}
