package com.spring_boot_final.project.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.spring_boot_final.project.dao.IBookMarkDAO;
import com.spring_boot_final.project.model.BookMarkVO;

@Service
public class BookMarkService implements IBookMarkService {
	@Autowired
	@Qualifier("IBookMarkDAO")
	IBookMarkDAO dao;
	
	@Override
	public ArrayList<BookMarkVO> bookMarkList(String userId){
		return dao.bookMarkList(userId);
	}
	
	@Override
	public void insertBookMark(BookMarkVO vo ) {
		dao.insertBookMark(vo);
	}

	@Override
	public int checkExInBookMark(String exhbnId, String userId) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("exhbnId", exhbnId);
		map.put("userId", userId);
		
		return dao.checkExInBookMark(map);
	}

	@Override
	public void deleteBookMark(BookMarkVO vo) {
		dao.deleteBookMark(vo);
		
	}


	@Override
	public BookMarkVO selectBookMark(int bookmarkId) {
		return dao.selectBookMark(bookmarkId);
	}








}
