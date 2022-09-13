package com.spring_boot_final.project.controller.myPage;



import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring_boot_final.project.model.NoteCommentVO;
import com.spring_boot_final.project.model.CourseVO;
import com.spring_boot_final.project.model.NoteVO;
import com.spring_boot_final.project.model.UserVO;
import com.spring_boot_final.project.service.CommentService;
import com.spring_boot_final.project.service.CourseService;
import com.spring_boot_final.project.service.EmailService;
import com.spring_boot_final.project.service.NoteService;
import com.spring_boot_final.project.service.UserService;

@Controller
public class MpDataController {
	
	
	@Autowired
	UserService userService;
	
	@Autowired
	NoteService noteService;
	
	@Autowired
	CommentService cmtService;
	
	@Autowired
	CourseService courseService;
	
	@Autowired
	EmailService emailService;
	
	@Autowired
	PasswordEncoder encoder;
	
    // 마이페이지 홈 view
    @RequestMapping("myPage/home")
    public String viewMyPage(Model model
							,HttpSession session) {
    	
    	String userId = session.getAttribute("sid").toString();
    	
    	UserVO vo = userService.selectUserView(userId);
		
		model.addAttribute("user", vo);
    	return "myPage/home";
    }
    
    
    // 마이페이지 편집 
    @RequestMapping("myPage/edit")
    public String viewMyPageEdit(Model model
    							,HttpSession session) {
    	
    	String userId = session.getAttribute("sid").toString();
    	
    	UserVO vo = userService.selectUserView(userId);
		
    	
    	// 이메일
    	String email1 = vo.getUserEmail();
		String[] email = email1.split("@");
		email1 = email[0]; 
    	
		
		model.addAttribute("user", vo);
		model.addAttribute("email1", email1);
		String email2 = "@" + email[1];
		
		
		model.addAttribute("email2", email2);
    	return "myPage/edit";
    }
    
    // 마이페이지 수정(항목 수정) 
 	@ResponseBody
 	@RequestMapping("/myPage/updateUser")
 	public String myPageEditView(
 								@RequestParam("userName") String userName,
 								@RequestParam("nickname") String userNickname,
 								@RequestParam("userEmail1") String userEmail1,
 								@RequestParam("userEmail2") String userEmail2,
 								@RequestParam("userGender") String userGender,
 								Model model,
 								HttpSession session) throws IOException {
 		
 		String userId = session.getAttribute("sid").toString();
 		UserVO vo = userService.selectUserView(userId);
 		
 		
 		if(!userName.equals("false")) {
 			vo.setUserName(userName);	
 		}
 	
 		
 		if(!userNickname.equals("false")) {
 			vo.setUserNickname(userNickname);	
 		}
 		
 		if(!userEmail1.equals("false")) {
 			String userEmail = userEmail1 + "@" +  userEmail2;
 			vo.setUserEmail(userEmail);
 		}
 		
 	
 		
 		// 항목 수정
 		userService.updateUser(vo);
 		
 		model.addAttribute("userName", vo.getUserName());
 		model.addAttribute("userId",vo.getUserId());
 		model.addAttribute("userNickname", vo.getUserNickname());
 		model.addAttribute("userEmail", vo.getUserEmail()); 
 		model.addAttribute("userGender", vo.getUserGender()); 
 		
 		
 		System.out.println(userId);
 		System.out.println(userNickname);
 		
 		return "SUCCESS";
 	}
 	
 	// 마이페이지 비밀번호 확인 
 	@ResponseBody
    @RequestMapping("/myPage/userPwCheck")
    public String userPwCheck(
    					@RequestParam("userPw") String userPw,
    					HttpSession session
    ) {
    	
    	// 세션에 있는 아이디 받아오기
    	String userId = session.getAttribute("sid").toString();
    	
    	String pw = userService.userPwCheck(userId);
    	
    	// 비교
		if(encoder.matches(userPw, pw) == true) {
			return "SUCCESS";
		} else {
			return "FAIL";
		}
		
    }
 	
 	// 마이페이지 비밀번호 설정 
  	@ResponseBody
  	@RequestMapping("/myPage/updatePw")
  	public String userPwEdit(
  								@RequestParam("userPw") String userPw,
  								HttpSession session) throws IOException {
  		
  		String userId = session.getAttribute("sid").toString();
  		
  		UserVO vo = userService.selectUserView(userId);
  			
  		// 암호화
  		vo.setUserPw(encoder.encode(userPw));
  		
  		// 항목 수정
  		userService.updatePw(vo);
  		
  		System.out.println(userPw);
  		
  		return "SUCCESS";
  	}
  	
  	// 마이페이지 게시글 조회 
  	@RequestMapping("myPage/post")
  	public String myPageActHistoty(HttpSession session, 
  									Model model){
  		
    String userId = session.getAttribute("sid").toString();
    	
    ArrayList<NoteVO> vo = noteService.selectNoteView(userId);
  		
   	model.addAttribute("noteList", vo);
    	
  		return "myPage/post";
 	}
  	
  	// 마이페이지 게시글 삭제 
  	@RequestMapping("/myPage/deleteNoteView")
	@ResponseBody
    public String deleteNoteView(
					    		@RequestParam("noteId") int noteId,
					            HttpSession session){
    												

		 if(session.getAttribute("sid") == null) return "FAIL";
		 
		 noteService.deleteNoteView(noteId);
		

        return "SUCCESS";
    }
  	
  	
  	// 마이페이지 댓글 조회 
   	@RequestMapping("myPage/comment")
   	public String myPageComment(HttpSession session, 
   									Model model){
   		
     String userId = session.getAttribute("sid").toString();
     	
     ArrayList<NoteCommentVO> vo = cmtService.selectCommentView(userId);
   		
    	model.addAttribute("comment", vo);
     	
   		return "myPage/comment";
  	}
   	
   	
   	// 마이페이지 댓글 삭제 
   	@RequestMapping("/myPage/deleteMpComment")
 	@ResponseBody
     public String deleteMpComment(
 					    		@RequestParam("commentId") int commentId,
 					            HttpSession session){
     												

 		  if(session.getAttribute("sid") == null) return "FAIL";
 		 
 		 cmtService.deleteMpComment(commentId);
 		

         return "SUCCESS";
     }
   	
   	// 마이페이지 작성한 코스 게시물 조회 
   	@RequestMapping("myPage/coursePost")
   	public String myPageCoursePost(HttpSession session, 
   									Model model){
   		
     String userId = session.getAttribute("sid").toString();
     	
     ArrayList<CourseVO> vo = courseService.mpCoursePostSelect(userId);
   		
    	model.addAttribute("coursePost", vo);
     	
   		return "myPage/coursePost";
  	}
   	
	// 마이페이지 작성한 코스 게시물 삭제 
   	@ResponseBody
   	@RequestMapping("myPage/deleteMpCourse")
   	public String deleteMpCourse(
   								@RequestParam("courseId") int courseId,
   								HttpSession session){
   		
     	courseService.deleteMpCourse(courseId);
     	
   		return "SUCCESS";
  	}
   	
 	// 마이페이지 회원 탈퇴 view
    @RequestMapping("myPage/withdraw")
    public String myPagewithdraw(HttpSession session, 
    								Model model) {
    	
    	String userId = session.getAttribute("sid").toString();
    	
    	UserVO vo = userService.selectUserView(userId);
    	
		model.addAttribute("user", vo);
		
    	return "myPage/withdraw";
    }
 	
 	// 마이페이지 회원 삭제(Update)
 	@ResponseBody
 	@RequestMapping("/myPage/quitUser")
 	public String quitUser(@RequestParam("userPw") String userPw,
 							   HttpSession session) {
 		
 		String userId = session.getAttribute("sid").toString();
 		
 		UserVO vo = userService.selectUserView(userId);

        System.out.println(vo.getUserPw());
        
        // 비밀번호 비교 		
 		if (vo == null || !encoder.matches(userPw, vo.getUserPw())) 
 		return "FAIL";
 		
 		// 탈퇴
 		userService.quitUser(userId);
 		session.invalidate();
 		return "SUCCESS";
 	}
   

 	
 	
 	
 	
 	@ResponseBody
    @RequestMapping("/myPage/emailCheck")
    public boolean emailCheck(@RequestParam("email") String email) {
        System.out.println(email);
        if (userService.selectEmailCheck(email) > 0) {
            return false;
        } else {
            if (userService.selectEmailNumCheck2(email) > 0) {
            	userService.deleteEmailNum(email);
            }
            String emailNum = emailService.randomNum();
            if (emailService.certifyEmailSend2(email, emailNum)) {
            	userService.insertEmailNum(email, emailNum);
                return true;
            }
        }
        return false;
    }

    @RequestMapping("/myPage/nicknameCheck")
    @ResponseBody
    public boolean nicknameCheck(@RequestParam("userNickname") String userNickname) {
        System.out.println(userNickname);
        if (userService.selectNicknameCheck(userNickname) > 0) {
            return false;
        } else {
            return true;
        }

    }
    
    @ResponseBody
    @RequestMapping("/myPage/emailNumCheck")
    public boolean emailNumCheck(
            @RequestParam("email") String email,
            @RequestParam("email_check") String email_check
    ) {
        if (userService.selectEmailNumCheck(email, email_check) > 0) {
            return true;
        } else {
            return false;
        }

    }

}
