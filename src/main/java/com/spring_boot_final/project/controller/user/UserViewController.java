package com.spring_boot_final.project.controller.user;

import com.spring_boot_final.project.model.UserVO;
import com.spring_boot_final.project.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;

@Controller
public class UserViewController {

    @Autowired
    UserService service;

    @RequestMapping("login")
    public String login2(){
        return "user/login";
    }

    @RequestMapping("join")
    public String join(){
        return "user/join";
    }

    @RequestMapping("find")
    public String find(){
        return "user/find";
    }

    @RequestMapping("logout2")
    public String logout(HttpSession session){
        session.invalidate();
        return "redirect:/";
    }

    @RequestMapping("user/pwTemp")
    public String pwTemp(
            @RequestParam("id") String id,
            Model model){

        UserVO vo = new UserVO();
        vo.setUserId(id);

        vo = service.selectUser(vo);
        System.out.println("aaa"+vo.toString());

        if(!vo.getUserState().equals("3"))
            return "error";

        model.addAttribute("id",id);

        return "/user/pwChange";
    }

}
