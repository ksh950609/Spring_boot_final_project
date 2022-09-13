package com.spring_boot_final.project.controller.bookmark;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring_boot_final.project.model.BookMarkVO;
import com.spring_boot_final.project.service.BookMarkService;

@Controller
public class BookMarkController {
	@Autowired
	BookMarkService bookmarkService;
	
	//북마크 목록 보기 요청 처리
	@RequestMapping("/myPage/scrap")
	public String bookMarkList(HttpSession session, Model model) {
		// bookMark 테이블에서 현재 user에 해당하는 내용만 출력
		String userId = (String)session.getAttribute("sid");
		ArrayList<BookMarkVO> bookMarkList = bookmarkService.bookMarkList(userId);
		model.addAttribute("bookMarkList",bookMarkList);
		for(int i=0; i<bookMarkList.size();i++) {
			System.out.println(bookMarkList.get(i).getBookmarkId());
		}
		return "myPage/scrap";
	}
	
	// 북마크에 추가 요청
	@ResponseBody
	@RequestMapping("/insertBookMark")
	public String insertBookMark(BookMarkVO vo, HttpSession session, Model model) {
		
		// 로그인 성공 후 설정한 세션 sid 값 가져오기
		String userId = (String)session.getAttribute("sid");
		// VO에 userId 값 설정
		vo.setUserId(userId);
		/* vo.setExhbnIdBookMark(userId); */
		
		// 북마크에 같은 전시 있는지 확인
		int count = bookmarkService.checkExInBookMark(vo.getExhbnId(), userId);
		
		String resultmsg="";
		
		if(count == 0) {// 동일한 전시가 없다면 북마크에 추가
			resultmsg="<script>alert('북마크에 추가되었습니다!'); location.href='/myPage/scrap'</script>";
			bookmarkService.insertBookMark(vo);
		} else {// 이미 전시가 있다면 이미 존재한다는 팝업 표시
			resultmsg="<script>alert('이미 북마크에 저장되어 있는 전시입니다.'); location.href='/myPage/scrap'</script>";
	
		}
		
		
		/* bookmarkService.insertBookMark(vo); */
		
		System.out.println(vo.getExhbnId());
		
		/* return "redirect:/myPage/scrap" ; */// viewpage 이름 아님
		return resultmsg;
	}
	
	// 북마크 삭제
	@RequestMapping("/deleteBookMark")
	@ResponseBody
    public String deleteBookMark(
    		@RequestParam("bookmarkId") String bookmarkId,
            HttpSession session
    ){

		
		
		  if(session.getAttribute("sid") == null) return "FAIL";
		 
		 BookMarkVO vo = bookmarkService.selectBookMark(Integer.parseInt(bookmarkId));
		 
		 
		 vo = new BookMarkVO(); vo.setBookmarkId(Integer.parseInt(bookmarkId));
		  vo.setUserId(session.getAttribute("sid").toString());
		 
		 bookmarkService.deleteBookMark(vo);
		 
		
		System.out.println(bookmarkId);

        return "SUCCESS";
    }
		
	
}
