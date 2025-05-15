package com.example.mbboard.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.mbboard.dto.BoardDto;
import com.example.mbboard.dto.Page;
import com.example.mbboard.mapper.BoardMapper;

import lombok.extern.slf4j.Slf4j;

@Service
@Transactional
@Slf4j
public class BoardService implements IBoardService {
    @Autowired BoardMapper boardMapper; // 인터페이스 형태로 의존성 주입 -> 디커플링

    @Override
    public List<BoardDto> getBoardList(Page p) {
        return boardMapper.selectBoardListByPage(p);
    }
    
    @Override
    public int getTotalCount(String searchOption, String searchWord) {
        return boardMapper.selectTotalCount(searchOption, searchWord);
    }
    
    @Override
    public BoardDto getBoardOne(int boardNo) {
        return boardMapper.selectBoardOne(boardNo);
    }
    
    @Override
    public int updateBoard(BoardDto b) {
        return boardMapper.updateBoard(b);
    }
    
    @Override
    public int deleteBoardByKey(int boardNo) {
    	return boardMapper.deleteBoardByKey(boardNo);
    }
    
    @Override
    public int insertBoard(BoardDto b) {
    	return boardMapper.insertBoard(b);
    }
}
