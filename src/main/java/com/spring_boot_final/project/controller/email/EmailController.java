package com.spring_boot_final.project.controller.email;

import com.spring_boot_final.project.model.UserVO;
import com.spring_boot_final.project.service.EmailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class EmailController {

    @Autowired
    EmailService emailService;

    @RequestMapping("/find/id")
    public boolean id(@RequestParam("email") String email) {
        return emailService.certifyEmailSend(email);
    }

    @RequestMapping("/find/id/certify")
    public String idCertify(
            @RequestParam("email") String email,
            @RequestParam("certifyNum") String certifyNum
    ) {
        return emailService.idFindCertify(email, certifyNum);
    }

    @RequestMapping("/find/pw")
    public boolean pw(@RequestParam("email") String email) {
        return emailService.certifyEmailSend(email);
    }

    @RequestMapping("/find/pw/certify")
    public boolean pwCertify(
            @RequestParam("email") String email,
            @RequestParam("certifyNum") String certifyNum
    ) {
        return emailService.pwFindCertify(email, certifyNum);
    }

    @RequestMapping("/user/selectUserFromEmail")
    public boolean insertUser(
            @RequestParam("email") String email
    ){
        return emailService.selectUserFormEmail(email);
    }

}
