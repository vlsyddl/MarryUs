package kr.co.marryus.repository.domain;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;


public class myMain {
	private int todoTotal;
	private int todoDone;
	private int auctionTotal;
	private int auctionDone;
	private int likeCompany;
	private Budget totalBudget;
	private Todo todoThree;
	private Map<String,Integer> TenderCnt;
	private Date wedDate;
	
	
	
	

	public Map<String, Integer> getTenderCnt() {
		return TenderCnt;
	}
	public void setTenderCnt(Map<String, Integer> tenderCnt) {
		TenderCnt = tenderCnt;
	}
	public int getTodoTotal() {
		return todoTotal;
	}
	public void setTodoTotal(int todoTotal) {
		this.todoTotal = todoTotal;
	}
	public int getTodoDone() {
		return todoDone;
	}
	public void setTodoDone(int todoDone) {
		this.todoDone = todoDone;
	}
	public int getAuctionTotal() {
		return auctionTotal;
	}
	public void setAuctionTotal(int auctionTotal) {
		this.auctionTotal = auctionTotal;
	}
	public int getAuctionDone() {
		return auctionDone;
	}
	public void setAuctionDone(int auctionDone) {
		this.auctionDone = auctionDone;
	}
	public int getLikeCompany() {
		return likeCompany;
	}
	public void setLikeCompany(int likeCompany) {
		this.likeCompany = likeCompany;
	}
	public Budget getTotalBudget() {
		return totalBudget;
	}
	public void setTotalBudget(Budget totalBudget) {
		this.totalBudget = totalBudget;
	}
	public Todo getTodoThree() {
		return todoThree;
	}
	public void setTodoThree(Todo todoThree) {
		this.todoThree = todoThree;
	}
	public Date getWedDate() {
		return wedDate;
	}
	public void setWedDate(Date wedDate) {
		this.wedDate = wedDate;
	}
	
	
	
	
	
	
}
