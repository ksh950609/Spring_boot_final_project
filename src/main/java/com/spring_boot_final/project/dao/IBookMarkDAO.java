package com.spring_boot_final.project.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.spring_boot_final.project.model.BookMarkVO;

public interface IBookMarkDAO {
	public ArrayList<BookMarkVO> bookMarkList(String userId); // 북마크 리스트 보여주기
	public void insertBookMark(BookMarkVO vo); // 북마크 추가
	public int checkExInBookMark(HashMap<String, Object> map); // 북마크 목록에 동일한 전시 있는지 체크

	// 북마크 삭제
	void deleteBookMark(BookMarkVO vo);
	BookMarkVO selectBookMark(int bookmarkId);

}
