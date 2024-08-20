package store.userinterfaces;

import net.serenitybdd.annotations.DefaultUrl;
import net.serenitybdd.screenplay.targets.Target;
import net.thucydides.core.pages.PageObject;

@DefaultUrl("https://demoblaze.com")
public class DemoblazeHomePage extends PageObject {

    private DemoblazeHomePage(){}

    public static final Target SECTION = Target.the("Desired category on the site")
            .locatedBy("//a[@id=\"itemc\"][contains(text(),'%s')]");
    public static final Target ITEM = Target.the("Desired article on the site")
            .locatedBy("//div[@id=\"tbodyid\"]//h4/a[contains(text(),'%s')]");
    public static final Target CART_BUTTON = Target.the("Button to go to the shopping cart")
            .locatedBy("//a[@class='nav-link'][contains(text(),'Cart')]");

}
