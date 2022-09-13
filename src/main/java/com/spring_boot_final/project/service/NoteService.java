package com.spring_boot_final.project.service;

import com.spring_boot_final.project.dao.INoteDAO;
import com.spring_boot_final.project.model.NoteVO;
import com.spring_boot_final.project.state.Category;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class NoteService {

    @Autowired
    @Qualifier("INoteDAO")
    INoteDAO dao;

    public void createNote(NoteVO vo) {
        dao.createNote(vo);
    }

    public void updateNote(NoteVO vo) {
        dao.updateNote(vo);
    }

    public ArrayList<NoteVO> selectNoteList(String category, int page, String sort, String keyword) {

        HashMap<String, Object> map = new HashMap<>();
        map.put("category", category);
        map.put("page", --page * 10);
        map.put("sort", sort);
        map.put("keyword", keyword);

        ArrayList<NoteVO> vo = dao.selectNoteListFilter(map);

        for (NoteVO noteVO : vo) {
            if (dao.selectNoteLike(noteVO) > 0) {
                noteVO.setNoteLikeCheck(true);
            } else {
                noteVO.setNoteLikeCheck(false);
            }
        }

        return vo;
    }

    public NoteVO selectNote(int noteId) {
        return dao.selectNote(noteId);
    }

    public void deleteNote(NoteVO vo) {
        dao.deleteNote(vo);
    }

    public boolean noteLike(NoteVO vo) {
        System.out.println(dao.selectNoteLike(vo));
        if (dao.selectNoteLike(vo) > 0) {
            dao.updateNoteLikeDown(vo.getNoteId());
            dao.deleteNoteLike(vo);
            return false;
        } else {
            dao.updateNoteLikeUp(vo.getNoteId());
            dao.insertNoteLike(vo);
            return true;
        }
    }

    public boolean noteLikeCheck(NoteVO vo, String userId) {
        vo.setUserId(userId);
        if (dao.selectNoteLike(vo) > 0) {
            return true;
        } else {
            return false;
        }
    }

    public int selectNoteCount(String category, String keyword){

        HashMap<String, Object> map = new HashMap<>();
        map.put("category", category);
        map.put("keyword", keyword);

        return dao.selectNoteCount(map);
    }

    public void updateNoteCommentUp(int noteId){
        dao.updateNoteCommentUp(noteId);
    }

    public void updateNoteCommentDown(int noteId){
        dao.updateNoteCommentDown(noteId);
    }
    
    // 마이페이지 게시글 조회
	public ArrayList<NoteVO> selectNoteView(String userId) {
		return dao.selectNoteView(userId);
	}
	
	// 마이페이지 게시글 삭제
	public void deleteNoteView(int noteId) {
			dao.deleteNoteView(noteId);
	}

	

}
