package store.stepdefinitions;

import io.cucumber.datatable.DataTable;
import io.cucumber.java.After;
import io.cucumber.java.BeforeAll;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import net.serenitybdd.screenplay.Actor;
import net.serenitybdd.screenplay.GivenWhenThen;
import net.serenitybdd.screenplay.actors.OnStage;
import net.serenitybdd.screenplay.actors.OnlineCast;
import net.serenitybdd.screenplay.ensure.Ensure;
import net.serenitybdd.screenplay.questions.page.TheWebPage;
import net.thucydides.core.webdriver.SerenityWebdriverManager;
import store.models.ItemsData;
import store.models.UserData;
import store.questions.Item;
import store.questions.Purchase;
import store.tasks.AddItem;
import store.tasks.Fill;
import store.tasks.Get;
import store.tasks.NavigateTo;
import store.utils.KillBrowser;
import store.utils.SetData;

import java.io.IOException;
import java.util.List;

import static net.serenitybdd.screenplay.actors.OnStage.theActorCalled;
import static net.serenitybdd.screenplay.actors.OnStage.theActorInTheSpotlight;

public class MakePurchaseStepDefinitions {

    private final SetData modelData = new SetData();

    @BeforeAll
    public static void before_all() {
        OnStage.setTheStage(new OnlineCast());
    }

    @After
    public static void CloseDriver() throws IOException, InterruptedException {
        SerenityWebdriverManager.inThisTestThread().getCurrentDriver().quit();
        KillBrowser.processes(List.of(SerenityWebdriverManager.inThisTestThread().getCurrentDriverName().split(":")).get(0));
    }

    @Given("that Esteban wants to make a purchase on the demoblaze site")
    public void that_esteban_wants_to_make_a_purchase_on_the_demoblaze_site() {
        theActorCalled("Esteban").wasAbleTo(NavigateTo.theSearchHomePage());
    }

    @When("^he adds the (.*) from the (.*) section to the cart$")
    public void he_adds_the_item_from_the_section_to_the_cart(String item, String section) {
        theActorCalled("Esteban").attemptsTo(AddItem.toTheShoppingCart(item, section));
    }

    @When("he sees the products in the shopping cart")
    public void he_sees_the_products_in_the_shopping_cart(DataTable dataTable) {
        List<ItemsData> data = modelData.setItemsData(dataTable);
        theActorCalled("Esteban").should(GivenWhenThen.seeThat(Item.isPresent(data.get(0).getFirstItem())));
        theActorCalled("Esteban").should(GivenWhenThen.seeThat(Item.isPresent(data.get(0).getSecondItem())));
        theActorCalled("Esteban").attemptsTo(Get.theAmount());
    }

    @When("he completes the purchase form")
    public void he_completes_the_purchase_form(DataTable dataTable) {
        List<UserData> data = modelData.setUserData(dataTable);
        theActorCalled("Esteban").attemptsTo(Fill.theForm(data.get(0)));
    }

    @Then("he sees the confirmation message")
    public void he_sees_the_confirmation_message(DataTable dataTable) {
        List<UserData> data = modelData.setUserData(dataTable);
        theActorCalled("Esteban").should(GivenWhenThen.seeThat(Purchase.wasSuccessful(data.get(0))));
    }

}
