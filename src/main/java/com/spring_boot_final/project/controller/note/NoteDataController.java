package com.spring_boot_final.project.controller.note;

import com.spring_boot_final.project.model.NoteVO;
import com.spring_boot_final.project.service.NoteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;

@RestController
public class NoteDataController {

    @Autowired
    NoteService service;

    @RequestMapping("/note/createNote")
    public String createNote(
            @RequestParam("title") String title,
            @RequestParam("category") String category,
            @RequestParam("note") String note,
            HttpSession session
    ) {

        if (session.getAttribute("sid") == null) {
            return "FAIL";
        }

        NoteVO vo = new NoteVO();
        vo.setNoteTitle(title);
        vo.setCategory(category);
        vo.setNote(note);
        vo.setUserId(session.getAttribute("sid").toString());

        service.createNote(vo);

        return "SUCCESS";
    }

    @RequestMapping("/note/updateNote")
    public String updateNote(
            @RequestParam("title") String title,
            @RequestParam("category") String category,
            @RequestParam("note") String note,
            @RequestParam("noteId") int noteId,
            HttpSession session
    ) {

        if (session.getAttribute("sid") == null) {
            return "FAIL";
        }

        NoteVO vo = new NoteVO();
        vo.setNoteTitle(title);
        vo.setCategory(category);
        vo.setNote(note);
        vo.setNoteId(noteId);
        vo.setUserId(session.getAttribute("sid").toString());

        service.updateNote(vo);

        return "SUCCESS";
    }

    @RequestMapping("/note/deleteNote")
    public String deleteNote(
            @RequestParam("noteId") int noteId,
            HttpSession session
    ) {

        if (session.getAttribute("sid") == null) {
            return "FAIL";
        }

        NoteVO vo = new NoteVO();
        vo.setNoteId(noteId);
        vo.setUserId(session.getAttribute("sid").toString());

        service.deleteNote(vo);

        return "SUCCESS";
    }

    @RequestMapping("/note/noteLike")
    public String noteLike(
            @RequestParam("noteId") int noteId,
            HttpSession session
    ) {

        if (session.getAttribute("sid") == null)
            return "FALSE";

        NoteVO vo = new NoteVO();
        vo.setNoteId(noteId);
        vo.setUserId(session.getAttribute("sid").toString());

        if (service.noteLike(vo)) {
            return "TRUE";
        } else {
            return "FALSE";
        }

    }

}
