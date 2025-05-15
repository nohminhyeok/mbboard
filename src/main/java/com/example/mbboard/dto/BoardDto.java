package com.example.mbboard.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BoardDto {
	private int boardNo;
	private String boardTitle;
	private String boardContent;
	private String boardUser;
	private String updatedate;
	private String createdate;
}
