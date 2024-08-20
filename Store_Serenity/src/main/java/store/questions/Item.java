package store.questions;

import net.serenitybdd.screenplay.Actor;
import net.serenitybdd.screenplay.Question;
import net.serenitybdd.screenplay.actions.Click;
import net.serenitybdd.screenplay.questions.Visibility;

import static store.userinterfaces.CartPage.CART_ITEM_NAME;
import static store.userinterfaces.DemoblazeHomePage.CART_BUTTON;

public class Item implements Question<Boolean> {

    private String item;

    public Item(String item) {
        this.item = item;
    }

    public static Item isPresent(String item) {
        return new Item(item);
    }

    @Override
    public Boolean answeredBy(Actor actor) {
        actor.attemptsTo(
                Click.on(CART_BUTTON)
        );
        return actor.asksFor(Visibility.of(
                String.format(CART_ITEM_NAME.getCssOrXPathSelector(), item)));
    }
}
