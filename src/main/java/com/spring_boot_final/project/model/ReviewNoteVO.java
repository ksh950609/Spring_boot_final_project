package com.spring_boot_final.project.model;

import java.util.Date;

import com.spring_boot_final.project.state.ViewState;

public class ReviewNoteVO {
	
	private int reviewNoteId;
	private String reviewNoteTitle;
	private String reviewNote;
	private int reviewNoteLike;
	private int reviewNoteCommentNum;
	private Date reviewNoteCreatedDate;
	private ViewState reviewPageViewState;
	private int courseId;
	private String userId;
	private String exhbnId;
	
	// DB에는 없지만 view에 출력할 때 사용할 필드
	private String courseSitesArr;
    private String courseAddressArr;
    private String courseMemoArr;
    private String courseTitle;
    private String courseTag;
    private String exhbnImgUrl;
    private String userNickname;
    
    
    
    
	public String getExhbnImgUrl() {
		return exhbnImgUrl;
	}
	public void setExhbnImgUrl(String exhbnImgUrl) {
		this.exhbnImgUrl = exhbnImgUrl;
	}
	public String getUserNickname() {
		return userNickname;
	}
	public void setUserNickname(String userNickname) {
		this.userNickname = userNickname;
	}
	public String getCourseTag() {
		return courseTag;
	}
	public void setCourseTag(String courseTag) {
		this.courseTag = courseTag;
	}
	public int getReviewNoteId() {
		return reviewNoteId;
	}
	public void setReviewNoteId(int reviewNoteId) {
		this.reviewNoteId = reviewNoteId;
	}
	public String getReviewNoteTitle() {
		return reviewNoteTitle;
	}
	public void setReviewNoteTitle(String reviewNoteTitle) {
		this.reviewNoteTitle = reviewNoteTitle;
	}
	public String getReviewNote() {
		return reviewNote;
	}
	public void setReviewNote(String reviewNote) {
		this.reviewNote = reviewNote;
	}
	public int getReviewNoteLike() {
		return reviewNoteLike;
	}
	public void setReviewNoteLike(int reviewNoteLike) {
		this.reviewNoteLike = reviewNoteLike;
	}
	public int getReviewNoteCommentNum() {
		return reviewNoteCommentNum;
	}
	public void setReviewNoteCommentNum(int reviewNoteCommentNum) {
		this.reviewNoteCommentNum = reviewNoteCommentNum;
	}
	

	public Date getReviewNoteCreatedDate() {
		return reviewNoteCreatedDate;
	}
	public void setReviewNoteCreatedDate(Date reviewNoteCreatedDate) {
		this.reviewNoteCreatedDate = reviewNoteCreatedDate;
	}
	public ViewState getReviewPageViewState() {
		return reviewPageViewState;
	}
	public void setReviewPageViewState(ViewState reviewPageViewState) {
		this.reviewPageViewState = reviewPageViewState;
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
	public String getExhbnId() {
		return exhbnId;
	}
	public void setExhbnId(String exhbnId) {
		this.exhbnId = exhbnId;
	}
	public String getCourseSitesArr() {
		return courseSitesArr;
	}
	public void setCourseSitesArr(String courseSitesArr) {
		this.courseSitesArr = courseSitesArr;
	}
	public String getCourseAddressArr() {
		return courseAddressArr;
	}
	public void setCourseAddressArr(String courseAddressArr) {
		this.courseAddressArr = courseAddressArr;
	}
	public String getCourseMemoArr() {
		return courseMemoArr;
	}
	public void setCourseMemoArr(String courseMemoArr) {
		this.courseMemoArr = courseMemoArr;
	}
	public String getCourseTitle() {
		return courseTitle;
	}
	public void setCourseTitle(String courseTitle) {
		this.courseTitle = courseTitle;
	}
    
    
	
	
}
