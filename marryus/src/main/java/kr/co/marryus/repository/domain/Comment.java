package kr.co.marryus.repository.domain;

import java.util.Date;

import lombok.Data;

@Data
public class Comment {
	private int commNo;
	private int boardNo;
	private String commWriter;
	private String commContent;
	private Date commDate;
}
