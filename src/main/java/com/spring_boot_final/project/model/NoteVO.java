package com.spring_boot_final.project.model;

import com.spring_boot_final.project.state.ViewState;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class NoteVO {

    private int noteId;
    private String userId;
    private ViewState pageViewState;
    private String category;
    private String noteTitle;
    private String note;
    private int noteLike;
    private int noteCommentNum;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date noteCreatedDate;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date noteUpdatedDate;
    private String userNickname;
    private boolean noteLikeCheck;

    public NoteVO() {
    }

    public boolean getNoteLikeCheck() {
        return noteLikeCheck;
    }

    public void setNoteLikeCheck(boolean noteLikeCheck) {
        this.noteLikeCheck = noteLikeCheck;
    }

    public int getNoteId() {
        return noteId;
    }

    public void setNoteId(int noteId) {
        this.noteId = noteId;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public ViewState getPageViewState() {
        return pageViewState;
    }

    public void setPageViewState(ViewState pageViewState) {
        this.pageViewState = pageViewState;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getNoteTitle() {
        return noteTitle;
    }

    public void setNoteTitle(String noteTitle) {
        this.noteTitle = noteTitle;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public int getNoteLike() {
        return noteLike;
    }

    public void setNoteLike(int noteLike) {
        this.noteLike = noteLike;
    }

    public int getNoteCommentNum() {
        return noteCommentNum;
    }

    public void setNoteCommentNum(int noteCommentNum) {
        this.noteCommentNum = noteCommentNum;
    }

    public Date getNoteCreatedDate() {
        return noteCreatedDate;
    }

    public void setNoteCreatedDate(Date noteCreatedDate) {
        this.noteCreatedDate = noteCreatedDate;
    }

    public Date getNoteUpdatedDate() {
        return noteUpdatedDate;
    }

    public void setNoteUpdatedDate(Date noteUpdatedDate) {
        this.noteUpdatedDate = noteUpdatedDate;
    }

    public String getUserNickname() {
        return userNickname;
    }

    public void setUserNickname(String userNickname) {
        this.userNickname = userNickname;
    }
}
