package store.runners;

import net.serenitybdd.cucumber.CucumberWithSerenity;
import io.cucumber.junit.CucumberOptions;
import org.junit.runner.RunWith;

@RunWith(CucumberWithSerenity.class)
@CucumberOptions(
        features = "src/test/resources/features/store/makepurchase.feature",
        glue = "store.stepdefinitions",
        tags = "",
        plugin = {"pretty"}
)
public class MakePurchaseRunner {
}
