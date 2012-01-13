package strombotne.spencer.kitchenmanager.web;

import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import strombotne.spencer.kitchenmanager.domain.Ingredient;

@RooWebScaffold(path = "ingredients", formBackingObject = Ingredient.class)
@RequestMapping("/ingredients")
@Controller
public class IngredientController {
}
