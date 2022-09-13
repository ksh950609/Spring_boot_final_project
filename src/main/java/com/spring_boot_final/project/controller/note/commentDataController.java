package com.spring_boot_final.project.controller.note;

import com.spring_boot_final.project.model.NoteCommentVO;
import com.spring_boot_final.project.service.CommentService;
import com.spring_boot_final.project.service.NoteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;

@RestController
public class commentDataController {

    @Autowired
    CommentService commentService;

    @Autowired
    NoteService noteService;

    @RequestMapping("/comment/createComment")
    public String createComment(
            @RequestParam("noteId") String noteId,
            @RequestParam("comment") String comment,
            HttpSession session
    ){

        if(session.getAttribute("sid") == null)
            return "FAIL";

        NoteCommentVO vo = new NoteCommentVO();
        vo.setNoteId(Integer.parseInt(noteId));
        vo.setComment(comment);
        vo.setUserId(session.getAttribute("sid").toString());

        commentService.createComment(vo);
        noteService.updateNoteCommentUp(vo.getNoteId());

        return "SUCCESS";
    }

    @RequestMapping("/comment/deleteComment")
    public String deleteComment(
            @RequestParam("noteId") int noteId,
            @RequestParam("commentId") String commentId,
            HttpSession session
    ){

        if(session.getAttribute("sid") == null)
            return "FAIL";

        NoteCommentVO vo = commentService.selectComment(Integer.parseInt(commentId));

        if(!vo.getUserId().equals(session.getAttribute("sid").toString())) {
            return "FAIL";
        }

        vo = new NoteCommentVO();
        vo.setCommentId(Integer.parseInt(commentId));
        vo.setUserId(session.getAttribute("sid").toString());

        commentService.deleteComment(vo);
        noteService.updateNoteCommentDown(noteId);

        return "SUCCESS";
    }

    @RequestMapping("/comment/commentLike")
    public String noteLike(
            @RequestParam("commentId") int commentId,
            HttpSession session
    ) {

        if (session.getAttribute("sid") == null)
            return "FALSE";

        NoteCommentVO vo = new NoteCommentVO();
        vo.setCommentId(commentId);
        vo.setUserId(session.getAttribute("sid").toString());

        if (commentService.commentLike(vo)) {
            return "TRUE";
        } else {
            return "FALSE";
        }

    }


}
