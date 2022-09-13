package com.spring_boot_final.project.controller.review;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring_boot_final.project.model.ReviewNoteVO;
import com.spring_boot_final.project.service.ReviewNoteService;

@Controller
public class reviewDataController {
	@Autowired
	ReviewNoteService reviewnoteService;
	
	@ResponseBody
	@RequestMapping("/review/createReviewNote")
	public String createReviewNote(
			@RequestParam("reviewNoteTitle") String reviewNoteTitle,
			@RequestParam("reviewNote") String reviewNote,
			@RequestParam("courseId") int courseId,
			@RequestParam("exhbnId") String exhbnId,
			HttpSession session) {
		
		if (session.getAttribute("sid") == null) {
			return "FAIL";
		}
		
		ReviewNoteVO vo = new ReviewNoteVO();
		vo.setReviewNoteTitle(reviewNoteTitle);
		vo.setReviewNote(reviewNote);
		vo.setCourseId(courseId);
		vo.setExhbnId(exhbnId);
		vo.setUserId(session.getAttribute("sid").toString());
		
		reviewnoteService.createReviewNote(vo);
		System.out.println(reviewNoteTitle);
		System.out.println(reviewNote);
		System.out.println(courseId);
		System.out.println(exhbnId);
		/*
		 * System.out.println(courseId); System.out.println(exhbnId);
		 */
		
		return "SUCCESS";
	}
	
	@ResponseBody
	@RequestMapping("/review/updateReviewNote")
	public String updateReviewNote(
			@RequestParam("reviewNoteTitle") String reviewNoteTitle,
			@RequestParam("reviewNote") String reviewNote,
			@RequestParam("reviewNoteId") int reviewNoteId,
			HttpSession session) {
		
		if (session.getAttribute("sid") == null) {
			return "FAIL";
		}
		
		ReviewNoteVO vo = new ReviewNoteVO();
		vo.setReviewNoteTitle(reviewNoteTitle);
		vo.setReviewNote(reviewNote);
		vo.setReviewNoteId(reviewNoteId);
		vo.setUserId(session.getAttribute("sid").toString());
		
		reviewnoteService.updateReviewNote(vo);
		/*
		 * System.out.println(reviewNoteTitle); System.out.println(reviewNote);
		 * System.out.println(reviewNoteId);
		 */

		
		return "SUCCESS";
	}
	
	@ResponseBody
	@RequestMapping("/review/deleteReviewNote")
	public String deleteReviewNote(
			@RequestParam("reviewNoteId") int reviewNoteId,
			HttpSession session
			) {
		if (session.getAttribute("sid") == null) {
            return "FAIL";
        }
		
		ReviewNoteVO vo = new ReviewNoteVO();
		vo.setReviewNoteId(reviewNoteId);
		vo.setUserId(session.getAttribute("sid").toString());
		
		reviewnoteService.deleteReviewNote(vo);
		System.out.println(reviewNoteId);
		
		return "SUCCESS";
		
	}
	
}
