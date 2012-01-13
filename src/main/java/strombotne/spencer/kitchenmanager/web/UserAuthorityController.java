package strombotne.spencer.kitchenmanager.web;

import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import strombotne.spencer.kitchenmanager.domain.UserAuthority;

@RooWebScaffold(path = "userauthoritys", formBackingObject = UserAuthority.class)
@RequestMapping("/userauthoritys")
@Controller
public class UserAuthorityController {
}
