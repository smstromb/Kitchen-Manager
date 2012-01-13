// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package strombotne.spencer.kitchenmanager.web;

import java.io.UnsupportedEncodingException;
import java.lang.Integer;
import java.lang.Long;
import java.lang.String;
import java.util.Collection;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;
import strombotne.spencer.kitchenmanager.domain.Login;
import strombotne.spencer.kitchenmanager.domain.UserAuthority;

privileged aspect LoginController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST)
    public String LoginController.create(@Valid Login login, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            uiModel.addAttribute("login", login);
            return "logins/create";
        }
        uiModel.asMap().clear();
        login.persist();
        return "redirect:/logins/" + encodeUrlPathSegment(login.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", method = RequestMethod.GET)
    public String LoginController.createForm(Model uiModel) {
        uiModel.addAttribute("login", new Login());
        return "logins/create";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public String LoginController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("login", Login.findLogin(id));
        uiModel.addAttribute("itemId", id);
        return "logins/show";
    }
    
    @RequestMapping(method = RequestMethod.GET)
    public String LoginController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            uiModel.addAttribute("logins", Login.findLoginEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) Login.countLogins() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("logins", Login.findAllLogins());
        }
        return "logins/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String LoginController.update(@Valid Login login, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            uiModel.addAttribute("login", login);
            return "logins/update";
        }
        uiModel.asMap().clear();
        login.merge();
        return "redirect:/logins/" + encodeUrlPathSegment(login.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", method = RequestMethod.GET)
    public String LoginController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("login", Login.findLogin(id));
        return "logins/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public String LoginController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Login.findLogin(id).remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/logins";
    }
    
    @ModelAttribute("logins")
    public Collection<Login> LoginController.populateLogins() {
        return Login.findAllLogins();
    }
    
    @ModelAttribute("userauthoritys")
    public Collection<UserAuthority> LoginController.populateUserAuthoritys() {
        return UserAuthority.findAllUserAuthoritys();
    }
    
    String LoginController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        }
        catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}
