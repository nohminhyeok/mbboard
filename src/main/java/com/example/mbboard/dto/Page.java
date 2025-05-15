package com.example.mbboard.dto;

import lombok.Data;

@Data
public class Page {
	private int rowPerPage;
	private int currentPage;
	
	private int beginRow;
	private int totalCount;	
	private String searchWord;
	private String searchOption;
	
	public String getSearchOption() {
	    return searchOption;
	}

	public void setSearchOption(String searchOption) {
	    this.searchOption = searchOption;
	}
	
	public Page(int rowPerPage, int currentPage, int totalCount, String searchWord, String searchOption) {
		this.rowPerPage = rowPerPage;
		this.currentPage = currentPage;
		this.totalCount = totalCount;
		this.searchWord = searchWord;
		this.searchOption = searchOption;
		this.beginRow = (currentPage - 1) * rowPerPage;
	}
	
	public int getLastPage() {
		int lastPage = this.totalCount / this.rowPerPage;
		if(this.totalCount % this.rowPerPage != 0) {
			lastPage += 1;
		}
		return lastPage;
	}
}
