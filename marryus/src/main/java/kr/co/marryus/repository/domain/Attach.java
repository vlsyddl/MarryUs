package kr.co.marryus.repository.domain;

import lombok.Data;

@Data
public class Attach {
	private int fileNo;
	private int boardNo;
	private String fileName;
	private String filePath;
}
