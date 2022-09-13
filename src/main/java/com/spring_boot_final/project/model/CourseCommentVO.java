package com.spring_boot_final.project.model;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class CourseCommentVO {
    private int commentId;
    private int courseId;
    private String userId;
    private String pageViewState;
    private String comment;
    private int commentLike;
    @DateTimeFormat(pattern = "yyyy-MM-dd hh:mm:ss")
    private Date commentCreatedDate;
    @DateTimeFormat(pattern = "yyyy-MM-dd hh:mm:ss")
    private Date commentUpdatedDate;

    private String userNickname;
    private boolean commentLikeCheck;

    public int getCommentId() {
        return commentId;
    }

    public void setCommentId(int commentId) {
        this.commentId = commentId;
    }

    public int getCourseId() {
        return courseId;
    }

    public void setCourseId(int courseId) {
        this.courseId = courseId;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getPageViewState() {
        return pageViewState;
    }

    public void setPageViewState(String pageViewState) {
        this.pageViewState = pageViewState;
    }


    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public int getCommentLike() {
        return commentLike;
    }

    public void setCommentLike(int commentLike) {
        this.commentLike = commentLike;
    }

    public Date getCommentCreatedDate() {
        return commentCreatedDate;
    }

    public void setCommentCreatedDate(Date commentCreatedDate) {
        this.commentCreatedDate = commentCreatedDate;
    }

    public Date getCommentUpdatedDate() {
        return commentUpdatedDate;
    }

    public void setCommentUpdatedDate(Date commentUpdatedDate) {
        this.commentUpdatedDate = commentUpdatedDate;
    }

    public String getUserNickname() {
        return userNickname;
    }

    public void setUserNickname(String userNickname) {
        this.userNickname = userNickname;
    }

    public boolean isCommentLikeCheck() {
        return commentLikeCheck;
    }

    public void setCommentLikeCheck(boolean commentLikeCheck) {
        this.commentLikeCheck = commentLikeCheck;
    }
}
