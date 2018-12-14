package kr.co.marryus.repository.domain;

import java.util.Date;

import lombok.Data;

@Data
public class Reservation {
	private int resNo;
	private int tenderNo;
	private String resVisit;
	private Date resDate;
	private int resTime;
	private String resEmail;
	private int resPhone;
	private String resMessage;
}
