package store.userinterfaces;

import net.serenitybdd.screenplay.targets.Target;
import net.thucydides.core.pages.PageObject;

public class ItemPage extends PageObject {

    public static final Target ADD_BUTTON = Target.the("Button to add the item to the shopping cart")
            .locatedBy("a[class^='btn'][onclick^='addToCart']");
    public static final Target HOME_BUTTON = Target.the("Button to go to the home page")
            .locatedBy("//a[@class='nav-link'][contains(text(),'Home')]");

}
