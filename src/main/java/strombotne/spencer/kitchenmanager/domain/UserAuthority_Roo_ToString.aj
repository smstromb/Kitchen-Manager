// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package strombotne.spencer.kitchenmanager.domain;

import java.lang.String;

privileged aspect UserAuthority_Roo_ToString {
    
    public String UserAuthority.toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("AuthorityName: ").append(getAuthorityName()).append(", ");
        sb.append("Id: ").append(getId()).append(", ");
        sb.append("Version: ").append(getVersion());
        return sb.toString();
    }
    
}
