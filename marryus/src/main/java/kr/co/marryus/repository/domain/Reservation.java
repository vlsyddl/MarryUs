package kr.co.marryus.repository.domain;

import java.util.Date;

public class Reservation {
	private int resNo;
	private int tenderNo;
	private String resVisit;
	private String resDate;
	private int resTime;
	private String resEmail;
	private int resPhone;
	private String resMessage;
	
	
	private int auctionNo;
	private String tenderStatus;
	private int tenderBudget;
	private Date tenderRegdate;
	private int memNo;
	private String memName;
	private String tenderInfo;
	private int comInfoNo;
	private String tenderTitle;
	public int getResNo() {
		return resNo;
	}
	public void setResNo(int resNo) {
		this.resNo = resNo;
	}
	public int getTenderNo() {
		return tenderNo;
	}
	public void setTenderNo(int tenderNo) {
		this.tenderNo = tenderNo;
	}
	public String getResVisit() {
		return resVisit;
	}
	public void setResVisit(String resVisit) {
		this.resVisit = resVisit;
	}
	public String getResDate() {
		return resDate;
	}
	public void setResDate(String resDate) {
		this.resDate = resDate;
	}
	public int getResTime() {
		return resTime;
	}
	public void setResTime(int resTime) {
		this.resTime = resTime;
	}
	public String getResEmail() {
		return resEmail;
	}
	public void setResEmail(String resEmail) {
		this.resEmail = resEmail;
	}
	public int getResPhone() {
		return resPhone;
	}
	public void setResPhone(int resPhone) {
		this.resPhone = resPhone;
	}
	public String getResMessage() {
		return resMessage;
	}
	public void setResMessage(String resMessage) {
		this.resMessage = resMessage;
	}
	public int getAuctionNo() {
		return auctionNo;
	}
	public void setAuctionNo(int auctionNo) {
		this.auctionNo = auctionNo;
	}
	public String getTenderStatus() {
		return tenderStatus;
	}
	public void setTenderStatus(String tenderStatus) {
		this.tenderStatus = tenderStatus;
	}
	public int getTenderBudget() {
		return tenderBudget;
	}
	public void setTenderBudget(int tenderBudget) {
		this.tenderBudget = tenderBudget;
	}
	public Date getTenderRegdate() {
		return tenderRegdate;
	}
	public void setTenderRegdate(Date tenderRegdate) {
		this.tenderRegdate = tenderRegdate;
	}
	public int getMemNo() {
		return memNo;
	}
	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}
	public String getMemName() {
		return memName;
	}
	public void setMemName(String memName) {
		this.memName = memName;
	}
	public String getTenderInfo() {
		return tenderInfo;
	}
	public void setTenderInfo(String tenderInfo) {
		this.tenderInfo = tenderInfo;
	}
	public int getComInfoNo() {
		return comInfoNo;
	}
	public void setComInfoNo(int comInfoNo) {
		this.comInfoNo = comInfoNo;
	}
	public String getTenderTitle() {
		return tenderTitle;
	}
	public void setTenderTitle(String tenderTitle) {
		this.tenderTitle = tenderTitle;
	}
	
	
}
