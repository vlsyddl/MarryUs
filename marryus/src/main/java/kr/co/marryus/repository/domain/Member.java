package kr.co.marryus.repository.domain;

import lombok.Data;

@Data
public class Member {
	private int no;
	private String email;
	private String pass;
	private String type;
	private String status;
	private String name;
	private String phone;
	// collection
	private General general;
	private Company company;
	private CompanyInfo comInfo;
	private CompanyFile comFile;
}
