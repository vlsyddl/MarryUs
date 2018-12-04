package kr.co.marryus.board.controller;


import java.io.File;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.view.UrlBasedViewResolver;

import kr.co.marryus.board.service.ReviewBoardService;
import kr.co.marryus.repository.domain.Attach;
import kr.co.marryus.repository.domain.Board;
import kr.co.marryus.repository.domain.Comment;
import kr.co.marryus.repository.domain.Page;
import kr.co.marryus.repository.domain.Recomm;
import kr.co.marryus.repository.domain.Search;

@Controller("kr.co.marryus.board.controller.ReviewBoardController")
@RequestMapping("/board")
public class ReviewBoardController {
	
	@Autowired
	private ReviewBoardService service;
	
	@Autowired
	ServletContext context;
	
	@RequestMapping("/review/list.do")
	public void boardList(@RequestParam(value = "pageNo", defaultValue = "1") int pageNo, Model model, Board board) throws Exception {
		Page page = new Page();
		page.setPageNo(pageNo);

		// 총 게시글 수 표시
		int count = service.selectReviewBoardCount();
		int lastPage = (int) Math.ceil(count / 10d);
		
		// 페이지 블럭 시작
		int pageSize = 10;
		int currTab = (pageNo - 1) / pageSize + 1;
		// 11번 부터 2페이지가 되는것
		int beginPage = (currTab - 1) * pageSize + 1;
		int endPage = currTab * pageSize < lastPage ? currTab * pageSize : lastPage;

		model.addAttribute("beginPage", beginPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("lastPage", lastPage);
		model.addAttribute("pageNo", pageNo);
		System.out.println(service.reviewBoardList(page));
		model.addAttribute("reviewList", service.reviewBoardList(page));
		System.out.println("boardList ============== " + service.reviewBoardList(page));
		model.addAttribute("count", service.selectReviewBoardCount());
//		model.addAttribute("reviewAttach", service.reviewAttachDetail(boardNo));
	}
	
	@RequestMapping("/review/detail.do")
	public void reviewDetail(Model model, int boardNo) {
		service.updateReviewBoardCnt(boardNo);
		model.addAttribute("reviewDetail", service.reviewBoardDetail(boardNo));
		model.addAttribute("reviewAttach", service.reviewAttachDetail(boardNo));
	}
	
	@RequestMapping("/review/writeForm.do")
	public void writeForm() {
	}
	
	@RequestMapping("/review/write.do")
	public String write(MultipartHttpServletRequest multi) {
		Board board = new Board();
		board.setTitle(multi.getParameter("title"));
		board.setWriter(multi.getParameter("writer"));
		board.setContent(multi.getParameter("content"));
		
		service.writeReviewBoard(board);
		
		int boardNo = board.getBoardNo();
		
//		String root = multi.getSession().getServletContext().getRealPath("/");
//        String path =  root + "file" + File.separator;
//        System.out.println("실제 파일 경로 : " +path);
		
        String newFileName = ""; // 업로드 되는 파일명
        String imgPath = context.getRealPath("/img/reviewImg");
        
        File dir = new File(imgPath);
        
        if(dir.exists() == false){
            dir.mkdir();
        }
		
        Iterator<String> files = multi.getFileNames();
        while( files.hasNext() ) { //다음 파일 없을때 까지 반복
        	Attach attach = new Attach();
            
        	String uploadFile = files.next();
            
            MultipartFile mFile = multi.getFile(uploadFile);
            String fileName = mFile.getOriginalFilename();
            String ext = fileName.substring(fileName.indexOf("."),fileName.length());
            newFileName = UUID.randomUUID().toString()+ext;
            
//            newFileName = System.currentTimeMillis()+"."
//                    +fileName.substring(fileName.lastIndexOf(".")+1);
//            fileName =UUID.randomUUID().toString()+ext;
            attach.setBoardNo(boardNo);
            attach.setFileName(newFileName);
            attach.setFilePath("/img/reviewImg");
            
            System.out.println("attach.boardNo" + attach.getBoardNo());
            System.out.println("attach.filePath" + attach.getFilePath());
            System.out.println("attach.fileName" + attach.getFileName());
            
            service.writeReviewFile(attach);
            
            try {
                mFile.transferTo(new File(imgPath+"/"+newFileName));
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "list.do";	
	}
	
	@RequestMapping("/review/delete.do")
	public String delete(int boardNo) {
		service.reviewBoardDelete(boardNo);
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "list.do";
	}
	
	@RequestMapping("/review/updateForm.do")
	public void updateForm(Model model, int boardNo) {
		model.addAttribute("reviewDetail", service.reviewBoardDetail(boardNo));
	}
	
	@RequestMapping("/review/update.do")
	public String update(MultipartHttpServletRequest multi) {
		Board board = new Board();
		int boardNo = Integer.parseInt(multi.getParameter("boardNo"));
		board.setBoardNo(boardNo);
		System.out.println("boardNo 첫번째===========" + board.getBoardNo());
		board.setTitle(multi.getParameter("title"));
		board.setContent(multi.getParameter("content"));
		service.updateReviewBoard(board);
		
        String newFileName = ""; // 업로드 되는 파일명
        String imgPath = context.getRealPath("/img/reviewImg");
        
        File dir = new File(imgPath);
        
        if(dir.exists() == false){
            dir.mkdir();
        }
		
        Iterator<String> files = multi.getFileNames();
        while( files.hasNext() ) { //다음 파일 없을때 까지 반복
        	Attach attach = new Attach();
            
        	String uploadFile = files.next();
            
            MultipartFile mFile = multi.getFile(uploadFile);
            String fileName = mFile.getOriginalFilename();
            String ext = fileName.substring(fileName.indexOf("."),fileName.length());
            newFileName = UUID.randomUUID().toString()+ext;
            
            attach.setBoardNo(boardNo);
    		System.out.println("attachNo 두번째===========" + attach.getBoardNo());
            attach.setFileName(newFileName);
            attach.setFilePath("/img/reviewImg");
            
            System.out.println("attach.boardNo" + attach.getBoardNo());
            System.out.println("attach.filePath" + attach.getFilePath());
            System.out.println("attach.fileName" + attach.getFileName());
            
            service.updateReviewFile(attach);
            
            try {
                mFile.transferTo(new File(imgPath+"/"+newFileName));
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "list.do";
	}
	
	@RequestMapping("/review/commentList.json")
	@ResponseBody
	public List<Comment> commentList(int boardNo) {
		return service.reviewCommentList(boardNo);
	}
	
	@RequestMapping("/review/commentWrite.json")
	@ResponseBody
	public void commentWrite(Comment comment) {
		service.writeReviewComment(comment);
	}
	
	@RequestMapping("/review/commentDelete.json")
	@ResponseBody
	public void commentDelete(int commNo) {
		service.deleteReviewComment(commNo);
	}
	
	@RequestMapping("/review/commentUpdate.json")
	@ResponseBody
	public void commentUpdate(Comment comment) {
		service.updateReviewComment(comment);
	}
	
	@RequestMapping("/review/recommCheck.json")
	@ResponseBody
	public int recommCheck(Recomm recomm) {
		return service.checkReviewRecomm(recomm);
	}
	
	@RequestMapping("/review/recommCount.json")
	@ResponseBody
	public int recommCount(int boardNo) {
		return service.selectReviewRecommCount(boardNo);
	}
	
	@RequestMapping("/review/recomm.json")
	@ResponseBody
	public void recomm(Recomm recomm) {
		service.insertReviewRecomm(recomm);
	}
	
	@RequestMapping("/review/recommCancle.json")
	@ResponseBody
	public void recommCancle(Recomm recomm) {
		service.deleteReviewRecomm(recomm);
	}
	
	@RequestMapping("/review/search.json")
	@ResponseBody
	public List<Board> search(@RequestParam(value = "pageNo", defaultValue = "1") int pageNo, Model model, Search search) throws Exception {
		// 총 게시글 수 표시
		int count = service.selectReviewSearchCount(search);
		int lastPage = (int) Math.ceil(count / 10d);
		System.out.println("count=============="+count);
		System.out.println("lastPage=============="+lastPage);
		// 페이지 블럭 시작
		int pageSize = 10;
		int currTab = (pageNo - 1) / pageSize + 1;
		System.out.println("pageNo =============="+pageNo);
		System.out.println("pagesize =============="+pageSize);
		// 11번 부터 2페이지가 되는것
		int beginPage = (currTab - 1) * pageSize + 1;
		int endPage = currTab * pageSize < lastPage ? currTab * pageSize : lastPage;
		System.out.println("service.reviewSearch(search) ============ " + service.reviewSearch(search));
		model.addAttribute("beginPage", beginPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("lastPage", lastPage);
		model.addAttribute("pageNo", pageNo);
		model.addAttribute("search", service.reviewSearch(search));
		return service.reviewSearch(search);
	}
}
