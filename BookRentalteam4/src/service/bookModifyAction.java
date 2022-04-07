package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.book_dao;
import dto.book_dto;




public class bookModifyAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("BoardModifyAction");
		
		int book_Num = Integer.parseInt(request.getParameter("book_Num"));
	//	String page = request.getParameter("page");
		
		book_dao dao = book_dao.getInstance();
		book_dto book = dao.getDetail(book_Num);	// 상세 정보 구하기
		
		// 공유 설정
		request.setAttribute("book", book);
	//	request.setAttribute("page", page);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);   // dispatcher 방식으로 포워딩
		forward.setPath("./admin/admin_bookmodify.jsp");
		
		return forward;
	}
}
