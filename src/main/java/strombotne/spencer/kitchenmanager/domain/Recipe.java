package strombotne.spencer.kitchenmanager.domain;

import org.springframework.roo.addon.entity.RooEntity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.util.Set;
import strombotne.spencer.kitchenmanager.domain.Ingredient;
import java.util.HashSet;
import javax.persistence.ManyToMany;
import javax.persistence.CascadeType;
import java.util.Date;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.springframework.format.annotation.DateTimeFormat;

@RooJavaBean
@RooToString
@RooEntity(finders = { "findRecipesByIngredients", "findRecipesByDescriptionLike", "findRecipesByDescriptionEquals", "findRecipesByDisplayNameLike", "findRecipesByDisplayNameEquals" })
public class Recipe {

    @NotNull
    @Size(min = 2, max = 50)
    private String displayName;

    @Size(max = 256)
    private String description;

    @ManyToMany(cascade = CascadeType.ALL)
    private Set<Ingredient> ingredients = new HashSet<Ingredient>();
}
