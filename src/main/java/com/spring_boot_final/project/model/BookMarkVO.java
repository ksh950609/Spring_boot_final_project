package com.spring_boot_final.project.model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class BookMarkVO {
	private int bookmarkId;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date bookmarkAt;
	private String userId;
	private String exhbnId;
	
	// DB에는 없지만 view에 출력할 때 사용할 필드
	private String exhbnTitle;
	private String exhbnImgUrl;
	
	/*
	 * private String exhbnIdBookMark;
	 * 
	 * public String getExhbnIdBookMark() { return exhbnIdBookMark; } public void
	 * setExhbnIdBookMark(String exhbnIdBookMark) { this.exhbnIdBookMark =
	 * exhbnIdBookMark; }
	 */
	
	public int getBookmarkId() {
		return bookmarkId;
	}
	public void setBookmarkId(int bookmarkId) {
		this.bookmarkId = bookmarkId;
	}
	public Date getBookmarkAt() {
		return bookmarkAt;
	}
	public void setBookmarkAt(Date bookmarkAt) {
		this.bookmarkAt = bookmarkAt;
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
	public String getExhbnTitle() {
		return exhbnTitle;
	}
	public void setExhbnTitle(String exhbnTitle) {
		this.exhbnTitle = exhbnTitle;
	}
	public String getExhbnImgUrl() {
		return exhbnImgUrl;
	}
	public void setExhbnImgUrl(String exhbnImgUrl) {
		this.exhbnImgUrl = exhbnImgUrl;
	}
	
	
	
}
