package kr.co.marryus.board.controller;

import java.io.File;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.view.UrlBasedViewResolver;

import kr.co.marryus.board.service.BoardService;
import kr.co.marryus.repository.domain.Attach;
import kr.co.marryus.repository.domain.Board;
import kr.co.marryus.repository.domain.Comment;
import kr.co.marryus.repository.domain.Page;
import kr.co.marryus.repository.domain.PageResult;
import kr.co.marryus.repository.domain.SearchForm;

@Controller("kr.co.marryus.board.controller.BoardController")
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	private BoardService service;
	
	// 공지사항 리스트
	@RequestMapping("/list.do")
	public String boardList(@RequestParam(value = "pageNo", defaultValue = "1") int pageNo, Model model, SearchForm form) throws Exception {
		form.setPageNo(pageNo);
		
		String page="";
		String category = form.getCategory();
		List<Board> list = service.boardList(form);
		
		model.addAttribute("list",list);
		model.addAttribute("pageResult",new PageResult(form.getPageNo(),service.boardCount(form),10,5));
		
		switch(category) {
			case "nt" :
				page = "board/notice/list";
				break;
			case "rv" :
				page = "board/review/list";
				break;
			case "fr" :
				page = "board/free/list";
				break;
			case "mm" :
				page = "board/mtom/list";
				break;
			case "fq" :
				page = "board/faq/list";
				break;
		}
		
		return page;
	}
	
	@RequestMapping("/detail.do")
	public String boardDetail(Model model, int boardNo) {
		
		String page ="";

		Board board = service.boradDetail(boardNo);
		String category = board.getCategory();
		
		model.addAttribute("board",board);
		
		switch(category) {
			case "nt" :
				page = "board/notice";
				break;
			case "rv" :
				page = "board/review";
				break;
			case "fr" :
				page = "board/free";
				break;
			case "mm" :
				page = "board/mtom";
				break;
			case "fq" :
				page = "board/faq";
				break;
		}
		
		return page+"/detail";
	}
	
	
	@RequestMapping("/review.do")
	public String review() {
		return "board/review/list";
	}
	
	@RequestMapping("/review/list.json")
	@ResponseBody
	public HashMap<String, Object> reviewList(SearchForm form){
		HashMap<String, Object> listMap = new HashMap<>();
		form.setCategory("rv");
		List<Board> list = service.reviewList(form);
		listMap.put("list", list);
		listMap.put("pageResult",new PageResult(form.getPageNo(),service.boardCount(form),9,5));
		listMap.put("boardCount",service.boardCount(form));
		return listMap;
	}
	
	@RequestMapping("/review/detail.json")
	@ResponseBody
	public HashMap<String, Object> reviewDetail(int boardNo) {
		HashMap<String, Object> listMap = new HashMap<>();
		listMap.put("board", service.boradDetail(boardNo));
		listMap.put("attach",service.attachDetail(boardNo));
		return listMap;
	}
	@RequestMapping("/review/commentList.json")
	@ResponseBody
	public List<Comment> reviceCommentList(int boardNo){
		return service.boardComment(boardNo);
	}
	/**
	 * 스터디 글쓰기
	 * @param board
	 */
	@RequestMapping("/review/write.json")
	@ResponseBody
	public int studyWrite(MultipartHttpServletRequest multi){
		
		//new
		
		System.out.println(multi.getParameter("title"));
		System.out.println(multi.getParameter("writer"));
		System.out.println(multi.getParameter("category"));
		System.out.println(multi.getParameter("content"));
        Board board = new Board();
        board.setTitle(multi.getParameter("title"));
        board.setWriter(multi.getParameter("writer"));
        board.setContent(multi.getParameter("content"));
        board.setCategory("rv");
        
		service.boardWrite(board);
		int boardNo = board.getNo();
		System.out.println(boardNo);
		// 저장 경로 설정
        String root = multi.getSession().getServletContext().getRealPath("/");
        String path =  root + "img" + File.separator + "reviewImg"+ File.separator;
        System.out.println("실제 파일 경로 : " +path);
        String newFileName = ""; // 업로드 되는 파일명
         
        File dir = new File(path);
        if(!dir.isDirectory()){
            dir.mkdir();
        }
        
        //파일 이름 찾기
        Iterator<String> files = multi.getFileNames();
        while(files.hasNext()){ //다음 파일 없을때 까지 반복
        	Attach attach = new Attach();
            
        	String uploadFile = files.next();
            
            MultipartFile mFile = multi.getFile(uploadFile);
            String fileName = mFile.getOriginalFilename();
            newFileName = System.currentTimeMillis()+"."
                    +fileName.substring(fileName.lastIndexOf(".")+1);
            
            attach.setBoardNo(boardNo);
            attach.setFilePath("/img/reviewImg");
            attach.setFileName(newFileName);
            service.attachFile(attach);
            
            try {
                mFile.transferTo(new File(path+newFileName));
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
		
		return boardNo;
	}
	
	@RequestMapping("/review/update.json")
	@ResponseBody
	public int updateBoard(MultipartHttpServletRequest multi) {
		Board board = new Board();
		int boardNo = Integer.parseInt(multi.getParameter("boardNo"));
		board.setTitle(multi.getParameter("title"));
		board.setBoardNo(boardNo);
        board.setContent(multi.getParameter("content"));
        service.updateBoard(board);
        
     // 저장 경로 설정
        String root = multi.getSession().getServletContext().getRealPath("/");
        String path =  root + "img" + File.separator + "reviewImg"+ File.separator;
        System.out.println("실제 파일 경로 : " +path);
        String newFileName = ""; // 업로드 되는 파일명
         
        File dir = new File(path);
        if(!dir.isDirectory()){
            dir.mkdir();
        }
        
        //파일 이름 찾기
        Iterator<String> files = multi.getFileNames();
        while(files.hasNext()){ //다음 파일 없을때 까지 반복
        	Attach attach = new Attach();
            
        	String uploadFile = files.next();
            
            MultipartFile mFile = multi.getFile(uploadFile);
            String fileName = mFile.getOriginalFilename();
            newFileName = System.currentTimeMillis()+"."
                    +fileName.substring(fileName.lastIndexOf(".")+1);
            
            attach.setFileNo(Integer.parseInt(multi.getParameter("fileNo")));
            attach.setFilePath("/img/reviewImg");
            attach.setFileName(newFileName);
            service.updateAttach(attach);
            
            try {
                mFile.transferTo(new File(path+newFileName));
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
		
		return boardNo;
	}
	
	@RequestMapping("/review/insertComment.json")
	@ResponseBody
	public int insertComment(Comment comment) {
		return service.insertComment(comment);
	}
	
	@RequestMapping("/review/updateComment.json")
	@ResponseBody
	public int updateComment(Comment comment) {
		return service.updateComment(comment);
	}
	
	
	
	@RequestMapping("/review/deleteBoard.json")
	@ResponseBody
	public String deleteBoard(int boardNo) {
		String result = "";
		if(service.deleteBoard(boardNo)==1) {
			result = "success";
		}else {
			result = "fail";
		}
		System.out.println(result);
		return "{\"result\":\""+result+"\"}";
	}

	@RequestMapping("/review/deleteComment.json")
	@ResponseBody
	public int deleteComment(int commNo) {
		return service.deleteComment(commNo);
	}
	
	
}
