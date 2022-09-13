package com.spring_boot_final.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.spring_boot_final.project.dao.IUserDAO;
import com.spring_boot_final.project.model.UserVO;

import java.util.HashMap;

@Service
public class UserService {

    @Autowired
    @Qualifier("IUserDAO")
    IUserDAO dao;

    public void insertUser(UserVO vo) {
        dao.insertUser(vo);
    }

    public UserVO selectUser(UserVO vo) {
        return dao.selectUser(vo);
    }

    // 마이페이지 유저 조회
    public UserVO selectUserView(String userId) {
        return dao.selectUserView(userId);
    }

    // 마이페이지 수정
    public void updateUser(UserVO vo) {
        dao.updateUser(vo);
    }

    // 개인정보 확인 view
    public String userPwCheck(String userId) {
        return dao.userPwCheck(userId);
    }


    // 비밀번호 수정
    public void updatePw(UserVO vo) {
        dao.updatePw(vo);
    }

    public void updatePwTempChange(UserVO vo){
        dao.updatePwTempChange(vo);
    }

    // 마이페이지 탈퇴
    public void quitUser(String id) {
        dao.quitUser(id);
    }

    public void insertEmailNum(String email, String emailNum) {
        HashMap<String, Object> map = new HashMap<>();
        map.put("email", email);
        map.put("emailNum", emailNum);
        dao.insertEmailNum(map);
    }

    public void deleteEmailNum(String email) {
        dao.deleteEmailNum(email);
    }

    public int selectIdCheck(String id) {
        return dao.selectIdCheck(id);
    }

    public int selectEmailCheck(String email) {
        return dao.selectEmailCheck(email);
    }

    public int selectEmailNumCheck(String email, String emailNum) {
        HashMap<String, Object> map = new HashMap<>();
        map.put("email", email);
        map.put("emailNum", emailNum);
        return dao.selectEmailNumCheck(map);
    }

    public int selectEmailNumCheck2(String email) {
        return dao.selectEmailNumCheck2(email);
    }

    public int selectNicknameCheck(String nickname) {
        return dao.selectNicknameCheck(nickname);
    }


}
