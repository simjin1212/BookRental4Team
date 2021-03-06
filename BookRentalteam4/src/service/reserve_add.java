package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.reserve_dao;
import dto.reserve_dto;

public class reserve_add implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("reserve_add");
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		
		reserve_dto reserve = new reserve_dto();
		reserve.setBook_Num(Integer.parseInt(request.getParameter("book_num")));
		reserve.setId(request.getParameter("id"));
		
		reserve_dao dao = reserve_dao.getInstance();
		int result = dao.insert(reserve);
		
		if(result ==1) System.out.println("예약추가완료");
		
		ActionForward forward=new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/ReserveList.do");
		return forward;
		
	}

}
