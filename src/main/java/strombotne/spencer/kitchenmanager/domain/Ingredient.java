package strombotne.spencer.kitchenmanager.domain;

import org.springframework.roo.addon.entity.RooEntity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;
import javax.validation.constraints.NotNull;
import strombotne.spencer.kitchenmanager.domain.IngredientType;
import javax.persistence.Enumerated;
import java.util.Date;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.springframework.format.annotation.DateTimeFormat;

@RooJavaBean
@RooToString
@RooEntity(finders = { "findIngredientsByDisplayNameEquals", "findIngredientsByDisplayNameLike", "findIngredientsByType" })
public class Ingredient {

    @NotNull
    private String displayName;

    @Enumerated
    private IngredientType type;

}
