package com.spring_boot_final.project.dao;

import java.util.ArrayList;

import com.spring_boot_final.project.model.ReviewNoteVO;

public interface IReviewNoteDAO {
	// 리뷰게시판 리스트 보여주기
	public ArrayList<ReviewNoteVO> reviewNoteList();
	
	ReviewNoteVO selectReviewNote(int reviewNoteId);
	
	// 리뷰 게시판 작성
	void createReviewNote (ReviewNoteVO vo);
	
	// 리뷰 게시판 수정
	void updateReviewNote (ReviewNoteVO vo);
	
	// 리뷰 게시판 삭제
	void deleteReviewNote (ReviewNoteVO vo);
	
}
