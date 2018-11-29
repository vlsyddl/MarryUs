package kr.co.marryus.repository.domain;

public class Search {
	private String type;
	private String content;
	private int pageNo;
	private int begin;
	private int end;
	
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
	
	public void setBegin(int begin) {
		this.begin = begin;
	}
	
	//#{end}
	public int getEnd() {
		return pageNo*10;
	}
	
	public void setEnd(int end) {
		this.end = end;
	}
	@Override
	public String toString() {
		return "Search [type=" + type + ", content=" + content + ", pageNo=" + pageNo + ", begin=" + begin + ", end="
				+ end + "]";
	}
	
}
