package com.spring_boot_final.project.model;

import com.spring_boot_final.project.state.ViewState;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class ExhbnVO{
    private int exhbnId;
    private String exhbnTitle;
    private String exhbnImgUrl;
    private String exhbnUrl;
    private String exhbnPlaceUrl;
    private String exhbnArea;
    private String exhbnPlace;
    private String exhbnPlaceAddr;
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date exhbnStartDate;
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date exhbnEndDate;
    private String exhbnPrice;
    private int exhbnPrice1;
    private String exhbnContent;
    private String exhbnPhone;
    private String exhbnWriter;
    private String exhbnHostOrganizer;
    private String exhbnNum;
    private double gpsX;
    private double gpsY;
    private int exhbnView;
    private int exhbnLike;
    private ViewState viewState; /* POST:정상 / WAIT:대기 / DELETE:삭제 */
    @DateTimeFormat(pattern="yyyy-MM-dd hh:mm:ss")
    private Date createdAt;
    @DateTimeFormat(pattern="yyyy-MM-dd hh:mm:ss")
    private Date updatedAt;
    private String exhbnType;
  
    
    public String getExhbnType() {
		return exhbnType;
	}

	public void setExhbnType(String exhbnType) {
		this.exhbnType = exhbnType;
	}

	public ExhbnVO(){

    }

    public int getExhbnId() {
        return exhbnId;
    }

    public void setExhbnId(int exhbnId) {
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

    public String getExhbnUrl() {
        return exhbnUrl;
    }

    public void setExhbnUrl(String exhbnUrl) {
        this.exhbnUrl = exhbnUrl;
    }

    public String getExhbnPlaceUrl() {
        return exhbnPlaceUrl;
    }

    public void setExhbnPlaceUrl(String exhbnPlaceUrl) {
        this.exhbnPlaceUrl = exhbnPlaceUrl;
    }

    public String getExhbnArea() {
        return exhbnArea;
    }

    public void setExhbnArea(String exhbnArea) {
        this.exhbnArea = exhbnArea;
    }

    public String getExhbnPlace() {
        return exhbnPlace;
    }

    public void setExhbnPlace(String exhbnPlace) {
        this.exhbnPlace = exhbnPlace;
    }

    public String getExhbnPlaceAddr() {
        return exhbnPlaceAddr;
    }

    public void setExhbnPlaceAddr(String exhbnPlaceAddr) {
        this.exhbnPlaceAddr = exhbnPlaceAddr;
    }

    public Date getExhbnStartDate() {
        return exhbnStartDate;
    }

    public void setExhbnStartDate(Date exhbnStartDate) {
        this.exhbnStartDate = exhbnStartDate;
    }

    public Date getExhbnEndDate() {
        return exhbnEndDate;
    }

    public void setExhbnEndDate(Date exhbnEndDate) {
        this.exhbnEndDate = exhbnEndDate;
    }

    public String getExhbnPrice() {
        return exhbnPrice;
    }

    public void setExhbnPrice(String exhbnPrice) {
        this.exhbnPrice = exhbnPrice;
    }

    public int getExhbnPrice1() {
        return exhbnPrice1;
    }

    public void setExhbnPrice1(int exhbnPrice1) {
        this.exhbnPrice1 = exhbnPrice1;
    }

    public String getExhbnContent() {
        return exhbnContent;
    }

    public void setExhbnContent(String exhbnContent) {
        this.exhbnContent = exhbnContent;
    }

    public String getExhbnPhone() {
        return exhbnPhone;
    }

    public void setExhbnPhone(String exhbnPhone) {
        this.exhbnPhone = exhbnPhone;
    }

    public String getExhbnWriter() {
        return exhbnWriter;
    }

    public void setExhbnWriter(String exhbnWriter) {
        this.exhbnWriter = exhbnWriter;
    }

    public String getExhbnHostOrganizer() {
        return exhbnHostOrganizer;
    }

    public void setExhbnHostOrganizer(String exhbnHostOrganizer) {
        this.exhbnHostOrganizer = exhbnHostOrganizer;
    }

    public String getExhbnNum() {
        return exhbnNum;
    }

    public void setExhbnNum(String exhbnNum) {
        this.exhbnNum = exhbnNum;
    }

    public double getGpsX() {
        return gpsX;
    }

    public void setGpsX(double gpsX) {
        this.gpsX = gpsX;
    }

    public double getGpsY() {
        return gpsY;
    }

    public void setGpsY(double gpsY) {
        this.gpsY = gpsY;
    }

    public int getExhbnView() {
        return exhbnView;
    }

    public void setExhbnView(int exhbnView) {
        this.exhbnView = exhbnView;
    }

    public int getExhbnLike() {
        return exhbnLike;
    }

    public void setExhbnLike(int exhbnLike) {
        this.exhbnLike = exhbnLike;
    }

    public ViewState getViewState() {
        return viewState;
    }

    public void setViewState(ViewState viewState) {
        this.viewState = viewState;
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
}
