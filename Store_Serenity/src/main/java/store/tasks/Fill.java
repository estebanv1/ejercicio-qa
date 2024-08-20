package store.tasks;

import net.serenitybdd.screenplay.Actor;
import net.serenitybdd.screenplay.Task;
import net.serenitybdd.screenplay.actions.Click;
import net.serenitybdd.screenplay.actions.Enter;
import net.serenitybdd.screenplay.waits.WaitUntil;
import net.thucydides.core.webdriver.WebDriverFacade;
import store.models.UserData;

import static net.serenitybdd.screenplay.Tasks.instrumented;
import static net.serenitybdd.screenplay.matchers.WebElementStateMatchers.*;
import static net.thucydides.core.webdriver.ThucydidesWebDriverSupport.getDriver;
import static store.userinterfaces.CartPage.*;
import static store.userinterfaces.DemoblazeHomePage.ITEM;
import static store.userinterfaces.DemoblazeHomePage.SECTION;
import static store.userinterfaces.ItemPage.ADD_BUTTON;
import static store.userinterfaces.ItemPage.HOME_BUTTON;

public class Fill implements Task{

    public Fill() {}

    private UserData userData;

    public Fill(UserData userData) {
        this.userData = userData;
    }

    public void tearDown() {
        ((WebDriverFacade) getDriver()).getProxiedDriver().switchTo().alert().accept();
    }

    @Override
    public <T extends Actor> void performAs(T actor) {
        actor.attemptsTo(
                Click.on(PLACE_ORDER_BUTTON),
                WaitUntil.the(PURCHASE_BUTTON, isPresent()).forNoMoreThan(30).seconds(),
                WaitUntil.the(NAME_INPUT, isPresent()).forNoMoreThan(30).seconds(),
                WaitUntil.the(NAME_INPUT, isEnabled()).forNoMoreThan(30).seconds(),
                WaitUntil.the(NAME_INPUT, isVisible()).forNoMoreThan(30).seconds().then(
                        Enter.theValue(userData.getName()).into(NAME_INPUT)),
                Enter.theValue(userData.getCountry()).into(COUNTRY_INPUT),
                Enter.theValue(userData.getCity()).into(CITY_INPUT),
                Enter.theValue(userData.getCreditCard()).into(CARD_INPUT),
                Enter.theValue(userData.getMonth()).into(MONTH_INPUT),
                Enter.theValue(userData.getYear()).into(YEAR_INPUT),
                Click.on(PURCHASE_BUTTON),
                WaitUntil.the(PURCHASE_MESSAGE, isVisible()).forNoMoreThan(30).seconds(),
                WaitUntil.the(PURCHASE_MESSAGE, isPresent()).forNoMoreThan(30).seconds(),
                WaitUntil.the(PURCHASE_MESSAGE, isEnabled()).forNoMoreThan(30).seconds()

        );
    }

    public static Fill theForm(UserData userData) {
        return instrumented(Fill.class, userData);
    }

}
