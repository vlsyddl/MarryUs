package kr.co.marryus.repository.domain;

import lombok.Data;

@Data
public class CompanyFile {
	private int comFileNo;
	private int comInfoNo;
	private String comFileName;
	private String comFileOriname;
	private String comFilePath;
	private String comFileRepr;
}
