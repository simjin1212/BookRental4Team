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
		int rentcheck = dao.rentcheck(book_Num);
		
		request.setAttribute("book", book);
		request.setAttribute("rentcheck", rentcheck);

		ActionForward forward = new ActionForward();
		forward.setRedirect(false); // dispatcher 방식으로 포워딩
		forward.setPath("./book/book_detail.jsp");

		return forward;
	}
	
	

}
