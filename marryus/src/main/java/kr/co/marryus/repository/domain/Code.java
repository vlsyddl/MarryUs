package kr.co.marryus.repository.domain;

import lombok.Data;

@Data
public class Code {
	private String codeNo;
	private String codeTable;
	private String codeColumn;
	private String codeName;
	private String codeValue;
}
