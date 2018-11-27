package kr.co.marryus.repository.domain;

import lombok.Data;

@Data
public class CompanyMember {
	private int memNo;
	private String memEmail;
	private String memPass;
	private String memType;
	private String memStatus;
	private String memName;
	private String comAddr;
	private String comAddrDetail;
	private String memPhone;
	private String comType;
	private String comOkay;
}
