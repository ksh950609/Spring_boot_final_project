package com.spring_boot_final.project.service;

import com.spring_boot_final.project.dao.ICertifyDAO;
import com.spring_boot_final.project.dao.IUserDAO;
import com.spring_boot_final.project.model.UserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Random;

@Service
public class EmailService {

    @Autowired
    @Qualifier("ICertifyDAO")
    ICertifyDAO certifyDAO;
    @Autowired
    @Qualifier("IUserDAO")
    IUserDAO userDAO;

    @Autowired
    PasswordEncoder encoder;
    @Autowired
    private JavaMailSender emailSender;

    public boolean certifyEmailSend(String email) {

        try {
            UserVO vo = userDAO.selectUserFormEmail(email);

            if (vo == null) {
                return false;
            }

            if (certifyDAO.readCertifyCount(email) > 0) {
                certifyDAO.deleteCertify(email);
            }

            HashMap<String, String> map = new HashMap<String, String>();
            map.put("userEmail", email);
            map.put("certifyNum", randomNum());

            certifyDAO.createCertify(map);

            sendSimpleMessage(
                    email,
                    map.get("certifyNum") + " Artchive 인증코드입니다",
                    "안녕하세요,\n" +
                            "현재 보안 인증 중 입니다. 귀하의 인증코드는 " + map.get("certifyNum") + " 입니다.\n" +
                            "\n" +
                            "30분 안에 인증을 완료해주세요.\n" +
                            "\n" +
                            "Artchive\n" +
                            "\n" +
                            "※본 메일은 자동응답 메일이므로 본 메일에 회신하지 마시기 바랍니다. ");

        } catch (Exception e) {
            System.out.println(e.getMessage());
            return false;
        }

        return true;
    }

    public boolean certifyEmailSend2(String email, String emailNum) {

        try {

            sendSimpleMessage(
                    email,
                    emailNum + " Artchive 인증코드입니다",
                    "안녕하세요,\n" +
                            "현재 보안 인증 중 입니다. 귀하의 인증코드는 " + emailNum + " 입니다.\n" +
                            "\n" +
                            "30분 안에 인증을 완료해주세요.\n" +
                            "\n" +
                            "Artchive\n" +
                            "\n" +
                            "※본 메일은 자동응답 메일이므로 본 메일에 회신하지 마시기 바랍니다. ");

        } catch (Exception e) {
            System.out.println(e.getMessage());
            return false;
        }

        return true;
    }

    public String idFindCertify(String email, String certifyNum) {

        if (certifyDAO.readCertifyCount(email) > 0) {
            String certifyNum1 = certifyDAO.readCertify(email);
            if (certifyNum1.equals(certifyNum)) {
                certifyDAO.deleteCertify(email);
                UserVO vo = userDAO.selectUserFormEmail(email);
                return vo.getUserId();
            }
        } else {
            return "FAIL";
        }
        return "FAIL";
    }

    public boolean pwFindCertify(String email, String certifyNum) {

        if (certifyDAO.readCertifyCount(email) > 0) {
            String certifyNum1 = certifyDAO.readCertify(email);
            if (certifyNum1.equals(certifyNum)) {
                certifyDAO.deleteCertify(email);
                String tempPw = getTempPassword();
                System.out.println(tempPw);
                UserVO vo = userDAO.selectUserFormEmail(email);
                vo.setUserPw(encoder.encode(tempPw));

                userDAO.updatePwTemp(vo);

                sendSimpleMessage(
                        email,
                        " Artchive 임시 비밀번호입니다.",
                        "안녕하세요,\n" +
                                "귀하의 임시 비밀번호는 " + tempPw + " 입니다.\n" +
                                "\n" +
                                "Artchive\n" +
                                "\n" +
                                "※본 메일은 자동응답 메일이므로 본 메일에 회신하지 마시기 바랍니다. ");
                return true;
            }
        } else {
            return false;
        }
        return false;
    }

    public void sendSimpleMessage(String to, String title, String content) {
        SimpleMailMessage message = new SimpleMailMessage();
        message.setFrom("arTchive08@gmail.com");
        message.setTo(to);
        message.setSubject(title);
        message.setText(content);
        emailSender.send(message);
    }

    public String randomNum() {
        Random random = new Random();        //랜덤 함수 선언
        int createNum = 0;            //1자리 난수
        String ranNum = "";            //1자리 난수 형변환 변수
        int letter = 6;            //난수 자릿수:6
        String resultNum = "";        //결과 난수

        for (int i = 0; i < letter; i++) {

            createNum = random.nextInt(9);        //0부터 9까지 올 수 있는 1자리 난수 생성
            ranNum = Integer.toString(createNum);  //1자리 난수를 String으로 형변환
            resultNum += ranNum;            //생성된 난수(문자열)을 원하는 수(letter)만큼 더하며 나열
        }

        System.out.println(resultNum);
        return resultNum;
    }

    public String getTempPassword() {
        char[] charSet = new char[]{'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', 'A', 'B', 'C', 'D', 'E', 'F',
                'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', '!', '@', '#', '$', '%', '^', '&', '*'};

        String str = "";

        // 문자 배열 길이의 값을 랜덤으로 10개를 뽑아 구문을 작성함
        int idx = 0;
        for (int i = 0; i < 10; i++) {
            idx = (int) (charSet.length * Math.random());
            str += charSet[idx];
        }
        return str;
    }

    public boolean selectUserFormEmail(String email) {

        UserVO vo = userDAO.selectUserFormEmail(email);

        if (vo != null)
            return true;

        return false;

    }

}

