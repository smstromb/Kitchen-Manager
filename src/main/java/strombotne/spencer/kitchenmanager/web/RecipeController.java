package strombotne.spencer.kitchenmanager.web;

import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import strombotne.spencer.kitchenmanager.domain.Recipe;

@RooWebScaffold(path = "recipes", formBackingObject = Recipe.class)
@RequestMapping("/recipes")
@Controller
public class RecipeController {
}
