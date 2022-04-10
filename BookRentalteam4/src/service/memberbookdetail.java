package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.book_dao;
import dto.book_dto;

public class memberbookdetail implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("memberbookdetail");
		
		int book_Num = Integer.parseInt(request.getParameter("no"));
		
		book_dao dao = book_dao.getInstance();
		book_dto book = dao.getDetail(book_Num); // 상세정보 구하기
		
		book.setBook_Name(request.getParameter("book_num"));
		book.setGenre(request.getParameter("book_name"));
		book.setPublisher(request.getParameter("book_cover"));
		book.setBook_Cover(request.getParameter("writer"));
		book.setWriter(request.getParameter("publisher"));
		book.setWriter_talks(request.getParameter("genre"));
		book.setWriter_talks(request.getParameter("book_regDate"));
		book.setWriter_talks(request.getParameter("writer_talks"));
		
		request.setAttribute("book", book);


		ActionForward forward = new ActionForward();
		forward.setRedirect(false); // dispatcher 방식으로 포워딩
		forward.setPath("./book/book_detail.jsp");

		return forward;
	}
	
	

}
