package com.spring_boot_final.project.dao;

import java.util.ArrayList;

import org.springframework.stereotype.Component;

import com.spring_boot_final.project.model.NoteCommentVO;

@Component
public interface ICommentDAO {
    void createComment(NoteCommentVO vo);

    void updateComment(NoteCommentVO vo);

    ArrayList<NoteCommentVO> selectCommentList(int noteId);
    NoteCommentVO selectComment(int commentId);

    void deleteComment(NoteCommentVO vo);

    void updateCommentLikeUp(int commentId);
    void updateCommentLikeDown(int commentId);
    int selectCommentLike(NoteCommentVO vo);
    void insertCommentLike(NoteCommentVO vo);
    void deleteCommentLike(NoteCommentVO vo);
    
    // 마이페이지 댓글 조회
    ArrayList<NoteCommentVO> selectCommentView(String userId);
    
    // 마이페이지 댓글 삭제
    void deleteMpComment(int commentId);
    
}
