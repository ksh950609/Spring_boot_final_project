package com.spring_boot_final.project.controller.review;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring_boot_final.project.model.CourseCommentVO;
import com.spring_boot_final.project.model.CourseVO;
import com.spring_boot_final.project.model.ReviewNoteVO;
import com.spring_boot_final.project.service.CourseService;
import com.spring_boot_final.project.service.ExhbnService;
import com.spring_boot_final.project.service.ReviewNoteService;
import com.spring_boot_final.project.state.ViewState;

@Controller
public class reviewViewController {
	@Autowired
	ReviewNoteService reviewnoteService;
	
	@Autowired
    ExhbnService service;
	
    @Autowired
    CourseService courseService;
	
	/*
	 * // reviewNoteEdit 페이지 열기 요청 처리
	 * 
	 * @RequestMapping("/review/reviewNoteEdit") public String reviewNoteEdit() {
	 * return "review/reviewNoteEdit"; }
	 */
 	
	/*
	 * // reviewNoteEdit 페이지 열기 요청 처리
	 * 
	 * @RequestMapping("/review/reviewNoteWrite") public String reviewNoteWrite() {
	 * return "review/reviewNoteWrite"; }
	 */
 	
 // 리뷰게시판 리스트 보기
 	@RequestMapping("/review/reviewNoteList")
 	public String reviewNoteList(HttpSession session, Model model) {
		
 		
 	ArrayList<ReviewNoteVO> reviewNoteList = reviewnoteService.reviewNoteList();

 	model.addAttribute("reviewNoteList", reviewNoteList);
 	System.out.println(reviewNoteList.size());
 	
 	/*
 	 * for(int i=0; i<reviewNoteList.size();i++) {
 	 * System.out.println(reviewNoteList.get(i).getReviewNoteId()); }
 	 */
 	
 	return "review/reviewNoteList";
 	}
 	
 	
 	// 리뷰게시판 상세페이지 보기
 	@RequestMapping("/review/reviewNote/{reviewNoteId}")
 	public String reviewNote(@PathVariable("reviewNoteId") int reviewNoteId,HttpSession session, Model model) {
 	
 		ArrayList<ReviewNoteVO> reviewNoteList = reviewnoteService.reviewNoteList();
 		ReviewNoteVO vo = reviewnoteService.selectReviewNote(reviewNoteId);
 		
 		 if (vo.getReviewPageViewState() != ViewState.POST) { return "error"; }
 		
 		String[] siteName = vo.getCourseSitesArr().split(";;");
 		
 		System.out.println(siteName);
 		
 		model.addAttribute("reviewNoteList", reviewNoteList);
 		model.addAttribute("reviewNote", vo);
 		model.addAttribute("siteName", siteName);
 		
 		
		/* System.out.println(reviewNoteId); */
 		/* System.out.println(reviewNoteList.size()); */
 		
 		/*
 		 * for(int i=0; i<reviewNoteList.size();i++) {
 		 * System.out.println(reviewNoteList.get(i).getReviewNoteId()); }
 		 */
 		
 		return "review/reviewNote";
 		}
 	
 	// 코스 코스게시판에서 가져오기
  	@RequestMapping("/review/reviewNoteWrite/{courseId}")
  	public String selectCoursePost(@PathVariable("courseId") int courseId,
            HttpSession session,
            Model model) throws Exception {
  		
		CourseVO vo = courseService.selectCoursePost(courseId);
		ArrayList<CourseCommentVO> commentVo = courseService.selectCourseComment(courseId);
		model.addAttribute("course", vo);
		model.addAttribute("cComment",commentVo);
		
		ArrayList<String[]> sites = new ArrayList<String[]>();
		String[] siteName = vo.getCourseSitesArr().split(";;");
		String[] siteAddress = vo.getCourseAddressArr().split(";;");
		String[] siteMemo = vo.getCourseMemoArr().split(";;");
		
		model.addAttribute("siteName", siteName);
		model.addAttribute("siteAddress", siteAddress);
		model.addAttribute("siteMemo", siteMemo);
		
		return "review/reviewNoteWrite";
		}
  	
 // 리뷰게시판 수정페이지 보기
  	@RequestMapping("/review/reviewNoteEdit/{reviewNoteId}")
  	public String reviewNoteEdit(@PathVariable("reviewNoteId") int reviewNoteId,HttpSession session, Model model) {
  	
  		ArrayList<ReviewNoteVO> reviewNoteList = reviewnoteService.reviewNoteList();
  		ReviewNoteVO vo = reviewnoteService.selectReviewNote(reviewNoteId);
  		
  		String[] siteName = vo.getCourseSitesArr().split(";;");
  		
  		System.out.println(siteName);
  		
  		model.addAttribute("reviewNoteList", reviewNoteList);
  		model.addAttribute("reviewNote", vo);
  		model.addAttribute("siteName", siteName);
  		
  		
 		/* System.out.println(reviewNoteId); */
  		/* System.out.println(reviewNoteList.size()); */
  		
  		/*
  		 * for(int i=0; i<reviewNoteList.size();i++) {
  		 * System.out.println(reviewNoteList.get(i).getReviewNoteId()); }
  		 */
  		
  		return "review/reviewNoteEdit";
  		}
 	
}
