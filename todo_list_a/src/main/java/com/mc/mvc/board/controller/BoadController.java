package com.mc.mvc.board.controller;

import java.nio.charset.Charset;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.io.FileSystemResource;
import org.springframework.http.ContentDisposition;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;

import com.mc.mvc.board.dto.Board;
import com.mc.mvc.board.service.BoardService;
import com.mc.mvc.common.file.FileInfo;
import com.mc.mvc.member.dto.Member;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("board")
public class BoadController {
   
   Logger logger = LoggerFactory.getLogger(this.getClass());
   
   private final BoardService boardService;
   
   @GetMapping("board-form")
   public void boardForm() {}
   
   
   @GetMapping("list")
   public String boardList(Model model, @RequestParam(required = false, defaultValue = "1") int page, @SessionAttribute("auth") Member auth) {
      model.addAllAttributes(boardService.selectBoardList(page, auth.getUserId()));
      return "/todo";
   }
   
   @GetMapping("detail")
   public String boardContent(int bdIdx, Model model) {
      Map<String, Object> commandMap = boardService.selectBoardContentByBdIdx(bdIdx);
      model.addAllAttributes(commandMap);
      return "board/board-contents";
   }
   
   
   @PostMapping("upload")
   public String upload(Board board, @SessionAttribute Member auth) {
      
      board.setUserId(auth.getUserId());
      boardService.insertBoard(board);
      return "redirect:/board/list";
   }
   
  

   @PostMapping("remove")
   public String remove(int bdIdx) {
      boardService.deleteBoardByBdIdx(bdIdx);
      return "redirect:/board/list";
   }
   
   @GetMapping("modify")
   public String modify(int bdIdx, Model model) {
      Map<String, Object> commandMap = boardService.selectBoardContentByBdIdx(bdIdx);
      model.addAllAttributes(commandMap);
      return "board/todo-modify";
   }
   
   @PostMapping("modify")
   public String modify(Board board
                  , @SessionAttribute("auth") Member member) {
      
      board.setUserId(member.getUserId());
      
      boardService.updateBoard(board);
      
      return "redirect:/board/list";
      
   }
   
   
   
   
   
   
   
   
   
   
   
   
}