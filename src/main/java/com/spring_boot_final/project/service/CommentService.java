package com.spring_boot_final.project.service;

import com.spring_boot_final.project.dao.ICommentDAO;
import com.spring_boot_final.project.model.NoteCommentVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
public class CommentService {

    @Autowired
    @Qualifier("ICommentDAO")
    ICommentDAO dao;

    public void createComment(NoteCommentVO vo) {
        dao.createComment(vo);
    }

    public void updateComment(NoteCommentVO vo) {
        dao.updateComment(vo);
    }

    public ArrayList<NoteCommentVO> selectCommentList(int noteId) {
        return dao.selectCommentList(noteId);
    }

    public NoteCommentVO selectComment(int commentId) {
        return dao.selectComment(commentId);
    }

    public void deleteComment(NoteCommentVO vo) {
        dao.deleteComment(vo);
    }

    public boolean commentLike(NoteCommentVO vo) {
        System.out.println(dao.selectCommentLike(vo));
        if (dao.selectCommentLike(vo) > 0) {
            dao.updateCommentLikeDown(vo.getCommentId());
            dao.deleteCommentLike(vo);
            return false;
        } else {
            dao.updateCommentLikeUp(vo.getCommentId());
            dao.insertCommentLike(vo);
            return true;
        }
    }

    public boolean noteLikeCheck(NoteCommentVO vo, String userId) {
        vo.setUserId(userId);
        if (dao.selectCommentLike(vo) > 0) {
            return true;
        } else {
            return false;
        }
    }
    
    // 마이페이지 댓글 조회
    public ArrayList<NoteCommentVO> selectCommentView(String userId){
    	return dao.selectCommentView(userId);
    }
    
    // 마이페이지 댓글 삭제
    public void deleteMpComment(int commentId) {
    	dao.deleteMpComment(commentId);
    }

}
