package com.spring_boot_final.project.service;

import java.util.ArrayList;

import com.spring_boot_final.project.model.BookMarkVO;

public interface IBookMarkService {
	public ArrayList<BookMarkVO> bookMarkList(String userId); // 북마크 리스트 보여주기
	public void insertBookMark(BookMarkVO vo); // 북마크 추가
	public int checkExInBookMark(String exhbnId, String userId);
	
	// 북마크 삭제
	void deleteBookMark(BookMarkVO vo);
	BookMarkVO selectBookMark(int bookmarkId);
}
