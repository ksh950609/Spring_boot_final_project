package com.spring_boot_final.project.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CourseRouteVO {
    public String siteName;
    public String siteAddresses;
    public String siteMemos;
//    위도,경도 넣어두기

    public String getSiteName() {
        return siteName;
    }

    public void setSiteName(String siteName) {
        this.siteName = siteName;
    }

    public String getSiteAddresses() {
        return siteAddresses;
    }

    public void setSiteAddresses(String siteAddresses) {
        this.siteAddresses = siteAddresses;
    }

    public String getSiteMemos() {
        return siteMemos;
    }

    public void setSiteMemos(String siteMemos) {
        this.siteMemos = siteMemos;
    }
}
