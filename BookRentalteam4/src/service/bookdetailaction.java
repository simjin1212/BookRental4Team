package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.book_dao;
import dto.book_dto;



public class bookdetailaction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("bookdeatildaction");
		int book_Num = Integer.parseInt(request.getParameter("book_Num"));
		String page = request.getParameter("page");
		
		book_dao dao = book_dao.getInstance();
		book_dto book = dao.getDetail(book_Num); // 상세정보 구하기
		
		// 글내용에서 줄바꿈
		//String content = book.getWirter_Talks().replace("\n","<br>");
		
		// 공유 설정
		request.setAttribute("book", book);
		request.setAttribute("page", page);
		//request.setAttribute("content", content);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);  		// dispatcher 방식으로 포워딩
		forward.setPath("./admin/admin_bookview.jsp");
		
		return forward;
	}

}
