package com.spring_boot_final.project.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.stereotype.Component;

import com.spring_boot_final.project.model.NoteVO;

@Component
public interface INoteDAO {
    void createNote(NoteVO vo);

    void updateNote(NoteVO vo);

    void updateNoteLikeUp(int noteId);

    void updateNoteLikeDown(int noteId);

    int selectNoteCount(HashMap<String, Object> map);

    ArrayList<NoteVO> selectNoteListFilter(HashMap<String, Object> map);

    NoteVO selectNote(int noteId);

    int selectNoteLike(NoteVO vo);

    void insertNoteLike(NoteVO vo);

    void deleteNoteLike(NoteVO vo);

    void deleteNote(NoteVO vo);

    void updateNoteCommentUp(int noteId);
    void updateNoteCommentDown(int noteId);
   
    
    // 마이페이지 게시글 조회
    ArrayList<NoteVO> selectNoteView(String userId);
    
    // 마이페이지 게시글 삭제 
	void deleteNoteView(int userId);
    

}
