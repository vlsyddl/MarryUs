package kr.co.marryus.repository.domain;

import java.util.Date;

import lombok.Data;

@Data
public class Budget {
	private int budgNo;
	private int memNo;
	private String budgContent;
	private int budgBudget;
	private int budgExpenses;
	private String budgCategory;
	private String codeValue;
	
	private int percentBudgExpenses;
	private int sumTenderBudget;
	private int avgTenderBudget;
}
