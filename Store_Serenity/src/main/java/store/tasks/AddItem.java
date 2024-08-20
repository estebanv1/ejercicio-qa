package store.tasks;

import net.serenitybdd.screenplay.Actor;
import net.serenitybdd.screenplay.Task;
import net.serenitybdd.screenplay.actions.Click;
import net.serenitybdd.screenplay.ensure.Ensure;
import net.serenitybdd.screenplay.waits.WaitUntil;
import net.thucydides.core.webdriver.WebDriverFacade;
import org.openqa.selenium.Alert;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;


import java.time.Duration;

import static net.serenitybdd.screenplay.Tasks.instrumented;
import static net.serenitybdd.screenplay.matchers.WebElementStateMatchers.*;
import static net.thucydides.core.webdriver.ThucydidesWebDriverSupport.getDriver;
import static store.userinterfaces.DemoblazeHomePage.ITEM;
import static store.userinterfaces.DemoblazeHomePage.SECTION;
import static store.userinterfaces.ItemPage.ADD_BUTTON;
import static store.userinterfaces.ItemPage.HOME_BUTTON;

public class AddItem implements Task{

    public AddItem() {}

    private String section;
    private String item;

    public AddItem(String item, String section) {
        this.section = section;
        this.item = item;
    }

    public void tearDown() {

        WebDriver driver = getDriver();
        WebDriverWait wait = new WebDriverWait(getDriver(), Duration.ofSeconds(3));
        wait.until(ExpectedConditions.alertIsPresent());
        Alert alert = driver.switchTo().alert();
        Ensure.that(alert.getText()).isEqualTo("Product added");
        alert.accept();
    }

    @Override
    public <T extends Actor> void performAs(T actor) {
        actor.attemptsTo(
                Click.on(String.format(SECTION.getCssOrXPathSelector(), section)),
                WaitUntil.the(String.format(ITEM.getCssOrXPathSelector(), item), isPresent()).forNoMoreThan(30).seconds(),
                WaitUntil.the(String.format(ITEM.getCssOrXPathSelector(), item), isVisible()).forNoMoreThan(30).seconds().then(
                        Click.on(String.format(ITEM.getCssOrXPathSelector(), item))),
                WaitUntil.the(ADD_BUTTON, isEnabled()).forNoMoreThan(30).seconds(),
                WaitUntil.the(ADD_BUTTON, isVisible()).forNoMoreThan(30).seconds().then(
                        Click.on(ADD_BUTTON))
        );
        tearDown();
        actor.attemptsTo(
                WaitUntil.the(HOME_BUTTON, isVisible()).forNoMoreThan(30).seconds().then(
                        Click.on(HOME_BUTTON))
        );
    }

    public static AddItem toTheShoppingCart(String item, String section) {
        return instrumented(AddItem.class, item, section);
    }

}
