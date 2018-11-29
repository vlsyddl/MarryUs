package kr.co.marryus.repository.domain;

import lombok.Data;

@Data
public class Answer {

	private int questionNo;
	private int answerNo;
	private String content;
}
