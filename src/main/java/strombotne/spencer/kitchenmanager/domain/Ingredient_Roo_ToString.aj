// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package strombotne.spencer.kitchenmanager.domain;

import java.lang.String;

privileged aspect Ingredient_Roo_ToString {
    
    public String Ingredient.toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("DisplayName: ").append(getDisplayName()).append(", ");
        sb.append("Id: ").append(getId()).append(", ");
        sb.append("Type: ").append(getType()).append(", ");
        sb.append("Version: ").append(getVersion());
        return sb.toString();
    }
    
}
