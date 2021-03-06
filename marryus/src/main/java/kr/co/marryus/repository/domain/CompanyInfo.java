package kr.co.marryus.repository.domain;





import java.util.Date;

import lombok.Data;

@Data
public class CompanyInfo {
	private int comInfoNo;
	private int memNo;
	private String comInfoContent;
	private String comInfoProfile;
	private String comInfoName;
	private String comInfoPhone;
	private String comInfoAddr;
	private String comInfoAddrDetail;
	private String comInfoType;
	private String comInfoOkay;
	
	
	private String comFileName;
	private String comFilePath;
	
	
	private String auctionType;
	private Date auctionSdate;
	private Date auctionEdate;
	private int tenderBudget;
	private Date tenderRegdate;
	private String tenderTitle;
	private String tenderInfo;
	private int tenderNo;
	private String tenderStatus;
	private String codeValue;

	
	private String type;
	
	CompanyFile companyFile;
}
