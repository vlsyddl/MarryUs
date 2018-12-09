package kr.co.marryus.board.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

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
import kr.co.marryus.repository.domain.Answer;
import kr.co.marryus.repository.domain.Attach;
import kr.co.marryus.repository.domain.Board;
import kr.co.marryus.repository.domain.Comment;
import kr.co.marryus.repository.domain.PageResult;
import kr.co.marryus.repository.domain.SearchForm;

@Controller("kr.co.marryus.board.controller.BoardController")
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	private BoardService service;

	/**
	 * 게시판 목록
	 * @param pageNo
	 * @param model
	 * @param form
	 * @return
	 * @throws Exception
	 */
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

	/**
	 * 게시판 디테일
	 * @param model
	 * @param boardNo
	 * @return
	 */
	@RequestMapping("/detail.do")
	public String boardDetail(Model model, int boardNo) {
		
		String page ="";

		Board board = service.boradDetail(boardNo);
		service.updateBoardCount(boardNo);
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
	
	/**
	 * 게시판 디테일
	 * @param model
	 * @param boardNo
	 * @return
	 */
	@RequestMapping("/writeForm.do")
	public String boardWriteForm(String category) {
		
		String page ="";
		
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
		
		return page+"/writeForm";
	}
	
	@RequestMapping("/write.do")
	public String boardWrite(Board board,HttpServletResponse response) throws IOException {
		
		String category = board.getCategory();
		String result = "";
		
		String page ="";
		
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
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		if(service.boardWrite(board) ==1) {
			int boardNO = board.getBoardNo();
			result = UrlBasedViewResolver.REDIRECT_URL_PREFIX + "list.do?category="+category;
		}else{
			out.println("<script>alert('게시물이 등록에 실패하였습니다.');history.go(-1);</script>");
			out.flush();
		};
		return result;
	}
	
	/**
	 * 게시판 수정 폼
	 * @param model
	 * @param boardNo
	 * @return
	 */
	@RequestMapping("/updateForm.do")
	public String boardUpdateForm(Model model, String category,int boardNo) {
		model.addAttribute("board",service.boradDetail(boardNo));
		
		String page ="";
		
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
		
		return page+"/updateForm";
	}
	
	/**
	 * 게시판 수정
	 * @param board
	 * @param response
	 * @return
	 * @throws IOException
	 */
	@RequestMapping("/update.do")
	public String boardUpdate(Board board,HttpServletResponse response) throws IOException {
		String category = board.getCategory();
		String result = "";
		
		String page ="";
		
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
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		if(service.updateBoard(board) ==1) {
			int boardNO = board.getBoardNo();
			result = UrlBasedViewResolver.REDIRECT_URL_PREFIX + "list.do?category="+category;
		}else{
			out.println("<script>alert('게시물 수정에 실패하였습니다.');history.go(-1);</script>");
			out.flush();
		};
		return result;
	}
	
	@RequestMapping("/delete.do")
	public String deleteBoadr(int boardNo, String category, HttpServletResponse response) throws IOException {
		String page = "";
		String result="";
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
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		if(service.deleteBoard(boardNo)==1) {
			result = UrlBasedViewResolver.REDIRECT_URL_PREFIX + "list.do?category="+category;
		}else{
			out.println("<script>alert('게시물이 삭제에 실패하였습니다.');history.go(-1);</script>");
			out.flush();
		};
		return result;
	}
	
	/**
	 * 후기게시판 
	 * @return
	 */
	@RequestMapping("/review.do")
	public String review() {
		return "board/review/list";
	}
	
	/**
	 * 후기게시판 리스트
	 * @param form
	 * @return
	 */
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
	
	/**
	 * 후기게시판 디테일
	 * @param boardNo
	 * @return
	 */
	@RequestMapping("/review/detail.json")
	@ResponseBody
	public HashMap<String, Object> reviewDetail(int boardNo) {
		HashMap<String, Object> listMap = new HashMap<>();
		listMap.put("board", service.boradDetail(boardNo));
		listMap.put("attach",service.attachDetail(boardNo));
		return listMap;
	}
	
	/**
	 * 댓글 리스트
	 * @param boardNo
	 * @return
	 */
	@RequestMapping("/commentList.json")
	@ResponseBody
	public List<Comment> reviceCommentList(int boardNo){
		return service.boardComment(boardNo);
	}
	
	/**
	 * 글 작성
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
	
	/**
	 * 글 수정
	 * @param multi
	 * @return
	 */
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
	
	/**
	 * 후기게시판 글삭제
	 * @param boardNo
	 * @return
	 */
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
	
	/**
	 * 댓글 등록
	 * @param comment
	 * @return
	 */
	@RequestMapping("/insertComment.json")
	@ResponseBody
	public int insertComment(Comment comment) {
		return service.insertComment(comment);
	}
	
	/**
	 * 댓글수정
	 * @param comment
	 * @return
	 */
	@RequestMapping("/updateComment.json")
	@ResponseBody
	public int updateComment(Comment comment) {
		return service.updateComment(comment);
	}
	
	/**
	 * 댓글 삭제
	 * @param commNo
	 * @return
	 */
	@RequestMapping("/deleteComment.json")
	@ResponseBody
	public int deleteComment(int commNo) {
		return service.deleteComment(commNo);
	}
	
	/**
	 * 1:1 질문 답
	 * @param questionNo
	 * @return
	 */
	@RequestMapping("/boardAnswer.json")
	@ResponseBody
	public Answer boardAnswer(int questionNo) {
		return service.boardAnswer(questionNo);
	}
}
