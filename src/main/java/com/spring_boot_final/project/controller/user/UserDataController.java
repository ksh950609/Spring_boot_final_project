package com.spring_boot_final.project.controller.user;

import com.spring_boot_final.project.model.UserVO;
import com.spring_boot_final.project.service.EmailService;
import com.spring_boot_final.project.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;
import java.text.ParseException;
import java.text.SimpleDateFormat;

@RestController
public class UserDataController {

    @Autowired
    UserService service;

    @Autowired
    PasswordEncoder encoder;

    @Autowired
    EmailService emailService;

    @RequestMapping("/user/insertUser")
    public String insertUser(
            @RequestParam("id") String id,
            @RequestParam("pw") String pw,
            @RequestParam("email") String email,
            @RequestParam("nickname") String nickname,
            @RequestParam("gender") String gender,
            @RequestParam("birth") String birth
    ) throws ParseException {
        UserVO vo = new UserVO(id, encoder.encode(pw), email, nickname, gender, new SimpleDateFormat("yyyy-mm-dd").parse(birth));
        service.insertUser(vo);
        System.out.println(vo.toString());
        return "FAIL";
    }

    @RequestMapping("/user/selectUser")
    public String insertUser(
            @RequestParam("id") String id,
            @RequestParam("pw") String pw,
            HttpSession session
    ) {
        UserVO vo = new UserVO();

        vo.setUserId(id);

        vo = service.selectUser(vo);
        
        
        if (vo == null || !encoder.matches(pw, vo.getUserPw()))
            return "FAIL";
        
        if(vo.getUserState().equals("2")){
            return "AWAY";
         }
        
        if(vo.getUserState().equals("3")){
            return "TEMP";
        }

        session.setAttribute("sid", vo.getUserId());
        session.setAttribute("username", vo.getUserNickname());

        return "SUCCESS";
    }

    @RequestMapping("/user/pwTempChange")
    public String pwTempChange(
            @RequestParam("id") String id,
            @RequestParam("pwTemp") String pwTemp,
            @RequestParam("pw") String pw,
            HttpSession session
    ) {
        UserVO vo = new UserVO();
        System.out.println("bbb"+id);
        vo.setUserId(id);

        vo = service.selectUser(vo);

        if (vo == null || !encoder.matches(pwTemp, vo.getUserPw()))
            return "FAIL";

        vo.setUserPw(encoder.encode(pw));

        service.updatePwTempChange(vo);

        return "SUCCESS";
    }

    @RequestMapping("user/idCheck")
    public boolean idCheck(@RequestParam("id") String id) {
        System.out.println(id);
        if (service.selectIdCheck(id) > 0) {
            return false;
        } else {
            return true;
        }

    }

    @RequestMapping("user/emailCheck")
    public boolean emailCheck(@RequestParam("email") String email) {
        System.out.println(email);
        if (service.selectEmailCheck(email) > 0) {
            return false;
        } else {
            if (service.selectEmailNumCheck2(email) > 0) {
                service.deleteEmailNum(email);
            }
            String emailNum = emailService.randomNum();
            if (emailService.certifyEmailSend2(email, emailNum)) {
                service.insertEmailNum(email, emailNum);
                return true;
            }

        }
        return false;
    }

    @RequestMapping("user/nicknameCheck")
    public boolean nicknameCheck(@RequestParam("nickname") String nickname) {
        System.out.println(nickname);
        if (service.selectNicknameCheck(nickname) > 0) {
            return false;
        } else {
            return true;
        }

    }

    @RequestMapping("user/emailNumCheck")
    public boolean emailNumCheck(
            @RequestParam("email") String email,
            @RequestParam("email_check") String email_check
    ) {
        if (service.selectEmailNumCheck(email, email_check) > 0) {
            return true;
        } else {
            return false;
        }

    }


}
