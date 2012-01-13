package strombotne.spencer.kitchenmanager.domain;

import org.springframework.roo.addon.entity.RooEntity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.util.Set;
import strombotne.spencer.kitchenmanager.domain.UserAuthority;
import java.util.HashSet;
import javax.persistence.ManyToMany;
import javax.persistence.CascadeType;

@RooJavaBean
@RooToString
@RooEntity
public class Login {

    @NotNull
    @Size(min = 3, max = 15)
    private String username;

    @Size(max = 100)
    private String password;

    @NotNull
    private Boolean enabled;

    @ManyToMany(cascade = CascadeType.ALL)
    private Set<UserAuthority> userAuthorities = new HashSet<UserAuthority>();
}
