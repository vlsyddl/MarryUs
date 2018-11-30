package kr.co.marryus.repository.domain;

import lombok.Data;

@Data
public class GeneralMember {
	private int memNo;
	private String memEmail;
	private String memPass;
	private String memType;
	private String memStatus;
	private String memName;
	private String memPhone;
	private String genBirth;
	private String genGender;
	private int genNo;
	
}
