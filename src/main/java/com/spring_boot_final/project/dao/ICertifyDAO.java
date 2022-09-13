package com.spring_boot_final.project.dao;

import org.springframework.stereotype.Component;

import java.util.HashMap;

@Component
public interface ICertifyDAO {
    void createCertify(HashMap map);
    String readCertify(String email);
    int readCertifyCount(String email);
    void deleteCertify(String email);
}
