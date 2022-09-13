package com.spring_boot_final.project.model;

import lombok.Getter;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;
import java.util.List;

@Getter
@Setter
public class CourseVO {
    private int courseId;
    private String userId;
    private String userNickname;
    private String exhbnId;
    private String exhbnTitle;
    private String exhbnImgUrl;
    private String exhbnUrl;
    private String courseTitle;
    private String courseTag;
    private int courseView;
    private int courseLike;
    private int courseComment;
    private String courseState;
    @DateTimeFormat(pattern = "yyyy-MM-dd hh:mm:ss")
    private Date createdAt;
    @DateTimeFormat(pattern = "yyyy-MM-dd hh:mm:ss")
    private Date updatedAt;
    String placeNames;
    String categoryNames;
    String phones;
    String addressNames;
    String roadAddressNames;
    String postionX;
    String positionY;
    String placeUrls;
    String placeMemos;

    private List<CourseListItemVO> courseListItem;

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

    public String getExhbnImgUrl() {
        return exhbnImgUrl;
    }

    public void setExhbnImgUrl(String exhbnImgUrl) {
        this.exhbnImgUrl = exhbnImgUrl;
    }

    public String getExhbnUrl() {
        return exhbnUrl;
    }

    public void setExhbnUrl(String exhbnUrl) {
        this.exhbnUrl = exhbnUrl;
    }

    public String getCourseTitle() {
        return courseTitle;
    }

    public void setCourseTitle(String courseTitle) {
        this.courseTitle = courseTitle;
    }

    public String getCourseTag() {
        return courseTag;
    }

    public void setCourseTag(String courseTag) {
        this.courseTag = courseTag;
    }

    public int getCourseView() {
        return courseView;
    }

    public void setCourseView(int courseView) {
        this.courseView = courseView;
    }

    public int getCourseLike() {
        return courseLike;
    }

    public void setCourseLike(int courseLike) {
        this.courseLike = courseLike;
    }

    public int getCourseComment() {
        return courseComment;
    }

    public void setCourseComment(int courseComment) {
        this.courseComment = courseComment;
    }

    public String getCourseState() {
        return courseState;
    }

    public void setCourseState(String courseState) {
        this.courseState = courseState;
    }

    public String getExhbnTitle() {
        return exhbnTitle;
    }

    public void setExhbnTitle(String exhbnTitle) {
        this.exhbnTitle = exhbnTitle;
    }

    public String getUserNickname() {
        return userNickname;
    }

    public void setUserNickname(String userNickname) {
        this.userNickname = userNickname;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    public Date getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(Date updatedAt) {
        this.updatedAt = updatedAt;
    }

    public List<CourseListItemVO> getCourseListItem() {
        return courseListItem;
    }

    public void setCourseListItem(List<CourseListItemVO> courseListItem) {
        this.courseListItem = courseListItem;
    }

    public String getPlaceNames() {
        return placeNames;
    }

    public void setPlaceNames(String placeNames) {
        this.placeNames = placeNames;
    }

    public String getCategoryNames() {
        return categoryNames;
    }

    public void setCategoryNames(String categoryNames) {
        this.categoryNames = categoryNames;
    }

    public String getPhones() {
        return phones;
    }

    public void setPhones(String phones) {
        this.phones = phones;
    }

    public String getAddressNames() {
        return addressNames;
    }

    public void setAddressNames(String addressNames) {
        this.addressNames = addressNames;
    }

    public String getRoadAddressNames() {
        return roadAddressNames;
    }

    public void setRoadAddressNames(String roadAddressNames) {
        this.roadAddressNames = roadAddressNames;
    }

    public String getPostionX() {
        return postionX;
    }

    public void setPostionX(String postionX) {
        this.postionX = postionX;
    }

    public String getPositionY() {
        return positionY;
    }

    public void setPositionY(String positionY) {
        this.positionY = positionY;
    }

    public String getPlaceUrls() {
        return placeUrls;
    }

    public void setPlaceUrls(String placeUrls) {
        this.placeUrls = placeUrls;
    }

    public String getPlaceMemos() {
        return placeMemos;
    }

    public void setPlaceMemos(String placeMemos) {
        this.placeMemos = placeMemos;
    }
}
