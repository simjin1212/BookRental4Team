package service;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.book_dao;
import dto.book_dto;



public class bookModify implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
System.out.println("BookModify");
		
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("utf-8");
		
		PrintWriter out = response.getWriter();
		
		System.out.println("bookupdateACtion");
		String path = request.getRealPath("bookcoverupload");
		System.out.println("path : "+path);
		
		int size = 1024*1024;
		int book_Num = Integer.parseInt(request.getParameter("book_Num"));
//		String page = request.getParameter("page");
//		String board_pass = request.getParameter("board_pass");
		
	
		book_dto book = new book_dto();
		book.setBook_Num(book_Num);
		book.setBook_Name(request.getParameter("book_name"));
		book.setGenre(request.getParameter("genre"));
		book.setPublisher(request.getParameter("publisher"));
		book.setBook_Cover(request.getParameter("book_cover"));
		book.setWriter_talks(request.getParameter("writer_talks"));
		
		book_dao dao = book_dao.getInstance();
		int result = dao.update(book);	// 상세정보 구하기
		if(result == 0)System.out.println("글 수정 성공");
		
		
		// 비번 비
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
//		forward.setPath("/BoardListAction.do?page="+page);
		forward.setPath("/bookDetailAction.do?book_Num="+book_Num);
		
		return forward;
		
	}

}


