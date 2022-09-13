package com.spring_boot_final.project.model.summary;


public class OptionVO{
	
	String language;
	String model;
	int tone;
	int summaryCount;
	
	public String getLanguage() {
		return language;
	}
	public void setLanguage(String language) {
		this.language = language;
	}
	public String getModel() {
		return model;
	}
	public void setModel(String model) {
		this.model = model;
	}
	public int getTone() {
		return tone;
	}
	public void setTone(int tone) {
		this.tone = tone;
	}
	public int getSummaryCount() {
		return summaryCount;
	}
	public void setSummaryCount(int summaryCount) {
		this.summaryCount = summaryCount;
	}
	
	
}