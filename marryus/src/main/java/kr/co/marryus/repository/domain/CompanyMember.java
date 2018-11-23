package kr.co.marryus.repository.domain;

import lombok.Data;

@Data
public class CompanyMember {
	private int memNo;
	private String memEmail;
	private String memPass;
	private String memType;
	private String memStatus;
	private String comName;
	private String comAddr;
	private String comAddrDetail;
	private String comPhone;
	private String comType;
	private String comOkay;
}
