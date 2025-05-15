package com.example.mbboard.service;

import java.util.List;

import com.example.mbboard.dto.BoardDto;
import com.example.mbboard.dto.Page;

public interface IBoardService {
    int getTotalCount(String searchOption, String searchWord);
    List<BoardDto> getBoardList(Page p);
    BoardDto getBoardOne(int boardNo); // 수정
    int updateBoard(BoardDto b);
	int deleteBoardByKey(int boardNo);
	int insertBoard(BoardDto b);
}