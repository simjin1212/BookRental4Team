package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.book_dto;
import sun.security.action.GetIntegerAction;

public class Booksearchaction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("Booksearch");
		
		request.setCharacterEncoding("utf-8");
		
		book_dto book = new book_dto();
		book.setBook_Num(Integer.parseInt(request.getParameter("book_num")));
		book.setBook_Name(request.getParameter("book_name"));
		book.setBook_Cover(request.getParameter("cover"));
		book.setWriter(request.getParameter("writer"));
		book.setPublisher(request.getParameter("publisher"));
		book.setGenre(request.getParameter("genre"));
		book.setWriter_talks(request.getParameter("writer_talks"));
		
		
		
		return null;
	}

}
