package com.example.mbboard.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.mbboard.dto.BoardDto;
import com.example.mbboard.dto.Page;

@Mapper
public interface BoardMapper {
	List<BoardDto> selectBoardListByPage(Page p);
	BoardDto selectBoardOne(@Param("boardNo") int boardNo);
	int insertBoard(BoardDto b);
	int updateBoard(BoardDto b);
	int deleteBoardByKey(int boardNo);
	int selectTotalCount(@Param("searchOption") String searchOption, @Param("searchWord") String searchWord);
}
