// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package strombotne.spencer.kitchenmanager.domain;

import java.lang.String;
import java.util.Date;
import strombotne.spencer.kitchenmanager.domain.IngredientType;

privileged aspect Ingredient_Roo_JavaBean {
    
    public String Ingredient.getDisplayName() {
        return this.displayName;
    }
    
    public void Ingredient.setDisplayName(String displayName) {
        this.displayName = displayName;
    }
    
    public IngredientType Ingredient.getType() {
        return this.type;
    }
    
    public void Ingredient.setType(IngredientType type) {
        this.type = type;
    }
    
    public Date Ingredient.getCreated() {
        return this.created;
    }
    
    public void Ingredient.setCreated(Date created) {
        this.created = created;
    }
    
}
