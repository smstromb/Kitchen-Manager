// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package strombotne.spencer.kitchenmanager.web;

import java.lang.String;
import java.util.Set;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import strombotne.spencer.kitchenmanager.domain.Ingredient;
import strombotne.spencer.kitchenmanager.domain.Recipe;

privileged aspect RecipeController_Roo_Controller_Finder {
    
    @RequestMapping(params = { "find=ByDescriptionEquals", "form" }, method = RequestMethod.GET)
    public String RecipeController.findRecipesByDescriptionEqualsForm(Model uiModel) {
        return "recipes/findRecipesByDescriptionEquals";
    }
    
    @RequestMapping(params = "find=ByDescriptionEquals", method = RequestMethod.GET)
    public String RecipeController.findRecipesByDescriptionEquals(@RequestParam("description") String description, Model uiModel) {
        uiModel.addAttribute("recipes", Recipe.findRecipesByDescriptionEquals(description).getResultList());
        return "recipes/list";
    }
    
    @RequestMapping(params = { "find=ByDescriptionLike", "form" }, method = RequestMethod.GET)
    public String RecipeController.findRecipesByDescriptionLikeForm(Model uiModel) {
        return "recipes/findRecipesByDescriptionLike";
    }
    
    @RequestMapping(params = "find=ByDescriptionLike", method = RequestMethod.GET)
    public String RecipeController.findRecipesByDescriptionLike(@RequestParam("description") String description, Model uiModel) {
        uiModel.addAttribute("recipes", Recipe.findRecipesByDescriptionLike(description).getResultList());
        return "recipes/list";
    }
    
    @RequestMapping(params = { "find=ByDisplayNameEquals", "form" }, method = RequestMethod.GET)
    public String RecipeController.findRecipesByDisplayNameEqualsForm(Model uiModel) {
        return "recipes/findRecipesByDisplayNameEquals";
    }
    
    @RequestMapping(params = "find=ByDisplayNameEquals", method = RequestMethod.GET)
    public String RecipeController.findRecipesByDisplayNameEquals(@RequestParam("displayName") String displayName, Model uiModel) {
        uiModel.addAttribute("recipes", Recipe.findRecipesByDisplayNameEquals(displayName).getResultList());
        return "recipes/list";
    }
    
    @RequestMapping(params = { "find=ByDisplayNameLike", "form" }, method = RequestMethod.GET)
    public String RecipeController.findRecipesByDisplayNameLikeForm(Model uiModel) {
        return "recipes/findRecipesByDisplayNameLike";
    }
    
    @RequestMapping(params = "find=ByDisplayNameLike", method = RequestMethod.GET)
    public String RecipeController.findRecipesByDisplayNameLike(@RequestParam("displayName") String displayName, Model uiModel) {
        uiModel.addAttribute("recipes", Recipe.findRecipesByDisplayNameLike(displayName).getResultList());
        return "recipes/list";
    }
    
    @RequestMapping(params = { "find=ByIngredients", "form" }, method = RequestMethod.GET)
    public String RecipeController.findRecipesByIngredientsForm(Model uiModel) {
        return "recipes/findRecipesByIngredients";
    }
    
    @RequestMapping(params = "find=ByIngredients", method = RequestMethod.GET)
    public String RecipeController.findRecipesByIngredients(@RequestParam("ingredients") Set<Ingredient> ingredients, Model uiModel) {
        uiModel.addAttribute("recipes", Recipe.findRecipesByIngredients(ingredients).getResultList());
        return "recipes/list";
    }
    
}
