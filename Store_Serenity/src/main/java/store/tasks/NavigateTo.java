package store.tasks;

import net.serenitybdd.screenplay.Performable;
import net.serenitybdd.screenplay.Task;
import net.serenitybdd.screenplay.actions.Open;
import store.userinterfaces.DemoblazeHomePage;

public class NavigateTo {
    public static Performable theSearchHomePage() {
        return Task.where("{0} opens the Demoblaze home page",
                Open.browserOn().the(DemoblazeHomePage.class));
    }
}
