package kr.co.marryus.repository.domain;

public class PageResult {
	private int count;
	private int lastPage;
	private int pageNo;
	private int beginPage;
	private int endPage;
	private boolean prev; 
	private boolean next; 
	/*
	 * @param count :게시물 개수
	 */
	public PageResult(int pageNo,int count) {
		this(pageNo,count,5,5);
	}
	public PageResult(int pageNo,int count,int listSize, int tabSize) {
		this.count = count;
		lastPage = (int) Math.ceil(count / (double)listSize);
		this.pageNo = pageNo;

		// 페이지 블럭 계산하기
		int currTab = (pageNo - 1) / tabSize +1;
		
		// 블럭에 해당하는 시작페이지와 끝페이지 계산하기
		beginPage = (currTab-1)*tabSize+1;
		endPage = (currTab * tabSize < lastPage) ? currTab * tabSize
				                                     : lastPage;
		//앞으로 이동 버튼 , 뒤로 이동 버튼
		prev = beginPage != 1;
		next = endPage != lastPage;
	}
	
	public int getCount() {return count;}

	public int getLastPage() {return lastPage;}

	public int getPageNo() {return pageNo;}

	public int getBeginPage() {return beginPage;}

	public int getEndPage() {return endPage;}

	public boolean isPrev() {return prev;}

	public boolean isNext() {return next;}

	//
}
