package kr.co.marryus.repository.domain;

public class SearchForm {
	private String type;
	private String content;
	private int pageNo;
	private String category;
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	
	//#{begin}
	public int getBegin() {
		return (pageNo -1) * 10;
	}
	
	//#{end}
	public int getEnd() {
		return pageNo*10;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	@Override
	public String toString() {
		return "SearchForm [type=" + type + ", content=" + content + ", pageNo=" + pageNo + ", category=" + category
				+ "]";
	}
	//
}
