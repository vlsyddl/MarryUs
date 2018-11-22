package kr.co.marryus.repository.domain;

import java.util.Date;

import lombok.Data;

@Data
public class Board {
	private int boardNo;
	private String title;
	private String writer;
	private String content;
	private Date regDate;
	private int viewCnt;
	private String category;
	private String answer;
}
