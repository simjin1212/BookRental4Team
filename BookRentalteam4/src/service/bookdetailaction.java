package service;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.book_dao;
import dao.rent_dao;
import dto.book_dto;
import dto.rent_dto;



public class bookdetailaction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("bookdeatildaction");
		int book_Num = Integer.parseInt(request.getParameter("book_Num"));
		String page = request.getParameter("page");
		
		
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		
		
		
		book_dao dao = book_dao.getInstance();
		book_dto book = dao.getDetail(book_Num); // 상세정보 구하기
		rent_dto rent = dao.getrentDetail(id);
		
		
		
		// 글내용에서 줄바꿈
		//String content = book.getWirter_Talks().replace("\n","<br>");
		
		// 공유 설정
		request.setAttribute("book", book);
		request.setAttribute("id", id);
		request.setAttribute("rent", rent);
	
		
		request.setAttribute("page", page);
		//request.setAttribute("content", content);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);  		// dispatcher 방식으로 포워딩
		forward.setPath("./admin/admin_bookview.jsp");
		
		return forward;
	}

}
