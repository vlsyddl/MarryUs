package kr.co.marryus.repository.domain;


import lombok.Data;

@Data
public class Venue {
	private int auctionNo;
	private String weddingVenue;
	private String weddingDate;
	private int weddingTime;
	private int weddingType;
	private int weddingVistor;
	private String weddingWish;
	private int weddingBudget;
	
}
