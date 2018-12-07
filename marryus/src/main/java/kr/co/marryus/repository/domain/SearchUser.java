package kr.co.marryus.repository.domain;


public class SearchUser {

	private String memType;
	private String type;
	private String content;
	private int pageNo;
	public String getMemType() {
		return memType;
	}
	public void setMemType(String memType) {
		this.memType = memType;
	}
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
	@Override
	public String toString() {
		return "SearchUser [memType=" + memType + ", type=" + type + ", content=" + content + ", pageNo=" + pageNo
				+ "]";
	}
}
