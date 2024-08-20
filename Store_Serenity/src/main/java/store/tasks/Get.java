package store.tasks;

import net.serenitybdd.screenplay.Actor;
import net.serenitybdd.screenplay.Task;
import net.serenitybdd.screenplay.actions.Click;
import net.serenitybdd.screenplay.questions.Text;
import net.serenitybdd.screenplay.waits.WaitUntil;
import net.thucydides.core.webdriver.WebDriverFacade;

import static net.serenitybdd.screenplay.Tasks.instrumented;
import static net.serenitybdd.screenplay.matchers.WebElementStateMatchers.isVisible;
import static net.thucydides.core.webdriver.ThucydidesWebDriverSupport.getDriver;
import static store.userinterfaces.CartPage.FIRST_CART_ITEM_PRICE;
import static store.userinterfaces.CartPage.SECOND_CART_ITEM_PRICE;
import static store.userinterfaces.DemoblazeHomePage.ITEM;
import static store.userinterfaces.DemoblazeHomePage.SECTION;
import static store.userinterfaces.ItemPage.ADD_BUTTON;
import static store.userinterfaces.ItemPage.HOME_BUTTON;

public class Get implements Task{

    public Get() {}


    public void tearDown() {
        ((WebDriverFacade) getDriver()).getProxiedDriver().switchTo().alert().accept();
    }

    @Override
    public <T extends Actor> void performAs(T actor) {
        String firstItemPrice = actor.asksFor(Text.of(FIRST_CART_ITEM_PRICE));
        String secondItemPrice = actor.asksFor(Text.of(SECOND_CART_ITEM_PRICE));
        int amount = Integer.parseInt(firstItemPrice) + Integer.parseInt(secondItemPrice);
        String expectedAmount = amount + " USD";
        actor.remember("Expected amount", expectedAmount);
    }

    public static Get theAmount() {
        return instrumented(Get.class);
    }

}
