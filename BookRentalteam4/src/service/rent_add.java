package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.rent_dao;
import dto.rent_dto;

public class rent_add implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("rent_add");
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		
		rent_dto rent = new rent_dto();
		rent.setBook_Num(Integer.parseInt(request.getParameter("book_num")));
		rent.setId(request.getParameter("id"));
		
		rent_dao dao = rent_dao.getInstance();
		int result = dao.insert(rent);
		
		
		
		if(result ==1) System.out.println("대출완료");
		request.setAttribute("result", result);
		
		ActionForward forward=new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./member/prerentlist.jsp");
		return forward;
		
	}

}
