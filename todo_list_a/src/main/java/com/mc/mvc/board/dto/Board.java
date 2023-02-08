package com.mc.mvc.board.dto;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import lombok.Data;

@Data
public class Board {

   private Integer bdIdx;
   private String userId;
   private LocalDateTime regDate;
   private String content;
   private Boolean isDel;
   
   public String getRegDateAsDate() {
      return regDate.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
   }
   
   public String getRegDateAsTime() {
      return regDate.format(DateTimeFormatter.ofPattern("HH:mm:ss"));
   }

   public Integer getBdIdx() {
      return bdIdx;
   }

   public void setBdIdx(Integer bdIdx) {
      this.bdIdx = bdIdx;
   }

   public String getUserId() {
      return userId;
   }

   public void setUserId(String userId) {
      this.userId = userId;
   }

   public LocalDateTime getRegDate() {
      return regDate;
   }

   public void setRegDate(LocalDateTime regDate) {
      this.regDate = regDate;
   }

   public String getContent() {
      return content;
   }

   public void setContent(String content) {
      this.content = content;
   }

   public Boolean getIsDel() {
      return isDel;
   }

   public void setIsDel(Boolean isDel) {
      this.isDel = isDel;
   }
   
   
}