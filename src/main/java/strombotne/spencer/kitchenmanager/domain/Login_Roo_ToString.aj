// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package strombotne.spencer.kitchenmanager.domain;

import java.lang.String;

privileged aspect Login_Roo_ToString {
    
    public String Login.toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Enabled: ").append(getEnabled()).append(", ");
        sb.append("Id: ").append(getId()).append(", ");
        sb.append("Password: ").append(getPassword()).append(", ");
        sb.append("UserAuthorities: ").append(getUserAuthorities() == null ? "null" : getUserAuthorities().size()).append(", ");
        sb.append("Username: ").append(getUsername()).append(", ");
        sb.append("Version: ").append(getVersion());
        return sb.toString();
    }
    
}
