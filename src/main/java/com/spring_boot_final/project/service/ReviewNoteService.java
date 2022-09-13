package com.spring_boot_final.project.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.spring_boot_final.project.dao.IReviewNoteDAO;
import com.spring_boot_final.project.model.ReviewNoteVO;

@Service
public class ReviewNoteService implements IReviewNoteService{
	@Autowired
	@Qualifier("IReviewNoteDAO")
	IReviewNoteDAO dao;

	@Override
	public ArrayList<ReviewNoteVO> reviewNoteList() {
		return dao.reviewNoteList();
	}

	@Override
	public ReviewNoteVO selectReviewNote(int reviewNoteId) {
		return dao.selectReviewNote(reviewNoteId);
	}

	@Override
	public void createReviewNote(ReviewNoteVO vo) {
		dao.createReviewNote(vo);
		
	}

	@Override
	public void updateReviewNote(ReviewNoteVO vo) {
		dao.updateReviewNote(vo);
		
	}

	@Override
	public void deleteReviewNote(ReviewNoteVO vo) {
		dao.deleteReviewNote(vo);
		
	}



}
