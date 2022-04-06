package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.book_dto;
import sun.security.action.GetIntegerAction;

public class Booksearch implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("Booksearch");
		
		request.setCharacterEncoding("utf-8");
		
		book_dto book = new book_dto();
		book.setBook_Num(request.getParameter("book_num"));
		book.setBook_Name(request.getParameter("book_name"));
		book.setBook_Cover(request.getParameter("cover"));
		book.setWriter(request.getParameter("writer"));
		book.setPublisher(request.getParameter("publisher"));
		book.setGenre(request.getParameter("genre"));
		book.setBook_regDate(request.get);
		book.setRent_Bool(request.geti);
		book.setReserve_Bool(GetIntegerAction());
		book.setWirter_Talks(request.getParameter("wirter_talks"));
		book.setMember_Num(request.getParameter("member_num"));
		
		
		
		return null;
	}

}
