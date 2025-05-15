package com.example.mbboard.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.mbboard.dto.BoardDto;
import com.example.mbboard.dto.Page;
import com.example.mbboard.mapper.BoardMapper;
import com.example.mbboard.service.IBoardService;

@Controller
public class BoardController {
	@Autowired IBoardService boardService;
	@Autowired BoardMapper boardMapper;
	
	@GetMapping("/boardList")
	public String boardList(Model model,
	        @RequestParam(value = "page", required = false, defaultValue = "1") int page
	        ,@RequestParam(value = "rowPerPage", required = false, defaultValue = "10") int rowPerPage
	        ,@RequestParam(value = "searchOption", required = false, defaultValue = "all") String searchOption
	        ,@RequestParam(value = "searchWord", defaultValue = "") String searchWord) {

		
		int totalCount = boardService.getTotalCount(searchOption, searchWord);

		Page p = new Page(rowPerPage, page, totalCount, searchWord, searchOption);


	    List<BoardDto> boardList = boardService.getBoardList(p);

	    p.setTotalCount(totalCount);

	    System.out.println("검색 옵션: " + searchOption);
	    System.out.println("검색어: " + searchWord);

	    model.addAttribute("boardList", boardList);
	    model.addAttribute("currentPage", page);
	    model.addAttribute("lastPage", p.getLastPage());
	    model.addAttribute("searchWord", searchWord);
	    model.addAttribute("searchOption", searchOption);
	    return "boardList";
	    
	}

	@PostMapping("/boardList")
	public String redirectToBoardList() {
		return "redirect:/boardList";
	}
	
	@GetMapping("/boardOne")
	public String boardOne(@RequestParam("boardNo") int boardNo, Model model) {
	    BoardDto board = boardService.getBoardOne(boardNo);
	    model.addAttribute("board", board);
	    return "boardOne";
	}
	
	@GetMapping("/updateBoard/{boardNo}")
	public String updateBoard(@PathVariable("boardNo") int boardNo, Model model) {
		BoardDto board = boardService.getBoardOne(boardNo);
        model.addAttribute("board", board);
        return "updateBoard";
	}
	
	@PostMapping("/updateBoard")
	public String updateBoard(
	        @RequestParam("boardNo") int boardNo,
	        @RequestParam("boardTitle") String boardTitle,
	        @RequestParam("boardContent") String boardContent,
	        @RequestParam("boardUser") String boardUser) {
	    
	    BoardDto boardDto = new BoardDto();
	    boardDto.setBoardNo(boardNo);
	    boardDto.setBoardTitle(boardTitle);
	    boardDto.setBoardContent(boardContent);
	    boardDto.setBoardUser(boardUser);
	    
	    int result = boardService.updateBoard(boardDto);
	    if (result > 0) {
	        return "redirect:/boardOne?boardNo=" + boardNo;
	    }
	    return "redirect:/updateBoard/" + boardNo;
	}
	
	@PostMapping("/deleteBoard")
	@ResponseBody
	public String deleteBoard(@RequestParam("boardNo") int boardNo) {
	    int result = boardService.deleteBoardByKey(boardNo);
	    if (result > 0) {
	        return "SUCCESS";  // 삭제 후 목록 페이지로 이동
	    }
	    return "FAIL";  // 삭제 실패 시 상세 페이지로 이동
	}
	
	@GetMapping("/insertBoard")
	public String insertBoardPage() {
	    return "insertBoard";
	}
	
	@PostMapping("/insertBoard")
	@ResponseBody
	public String insertBoard(
	        @RequestParam("boardTitle") String boardTitle,
	        @RequestParam("boardContent") String boardContent,
	        @RequestParam("boardUser") String boardUser) {
	    BoardDto b = new BoardDto();
	    b.setBoardTitle(boardTitle);
	    b.setBoardContent(boardContent);
	    b.setBoardUser(boardUser);

	    int result = boardService.insertBoard(b);

	    if (result > 0) {
	        return "SUCCESS";  // 성공 응답
	    } else {
	        return "FAIL";  // 실패 응답
	    }
	}
	
}
