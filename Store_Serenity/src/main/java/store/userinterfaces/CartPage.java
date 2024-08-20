package store.userinterfaces;

import net.serenitybdd.screenplay.targets.Target;
import net.thucydides.core.pages.PageObject;
import org.openqa.selenium.By;

public class CartPage extends PageObject {

    public static final Target CART_ITEM_NAME = Target.the("item in the the shopping cart")
            .locatedBy("//tbody[@id=\"tbodyid\"]/tr/td[contains(text(),'%s')]");
    public static final Target FIRST_CART_ITEM_PRICE = Target.the("item in the the shopping cart")
            .locatedBy("//tbody[@id=\"tbodyid\"]/tr[1]/td[3]");
    public static final Target SECOND_CART_ITEM_PRICE = Target.the("item in the the shopping cart")
            .locatedBy("//tbody[@id=\"tbodyid\"]/tr[2]/td[3]");
    public static final Target PLACE_ORDER_BUTTON = Target.the("Button to place the order")
            .located(By.cssSelector("button[class='btn btn-success']"));

    // Place order form

    public static final Target NAME_INPUT = Target.the("Input to enter the name")
            .locatedBy(".modal-body form div input[id='name']");
    public static final Target COUNTRY_INPUT = Target.the("Input to enter the country")
            .locatedBy(".modal-body form div input[id='country']");
    public static final Target CITY_INPUT = Target.the("Input to enter the city")
            .locatedBy(".modal-body form div input[id='city']");
    public static final Target CARD_INPUT = Target.the("Input to enter the card")
            .locatedBy(".modal-body form div input[id='card']");
    public static final Target MONTH_INPUT = Target.the("Input to enter the month")
            .locatedBy(".modal-body form div input[id='month']");
    public static final Target YEAR_INPUT = Target.the("Input to enter the year")
            .locatedBy(".modal-body form div input[id='year']");
    public static final Target PURCHASE_BUTTON = Target.the("Button to purchase the items")
            .locatedBy("//button[contains(text(),'Purchase')]");

    public static final Target PURCHASE_TEXT = Target.the("Purchase amount")
            .locatedBy("//p[@class='lead text-muted ']");
    public static final Target AMOUNT_TEXT = Target.the("Purchase amount")
            .locatedBy("//p[contains(text(), 'Id')]/text()[2]");
    public static final Target CARD_TEXT = Target.the("Purchase card")
            .locatedBy("//p[contains(text(), 'Id')]/text()[3]");
    public static final Target NAME_TEXT = Target.the("Purchase name")
            .locatedBy("//p[contains(text(), 'Id')]/text()[4]");
    public static final Target PURCHASE_MESSAGE = Target.the("Purchase name")
            .locatedBy("//h2[contains(text(), 'Thank you for your purchase!')]");

}
