package service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.reserve_dao;
import dto.reserve_dto;

public class reservedeleteaction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("reservedeleteaction");

		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		
		int book_num = Integer.parseInt(request.getParameter("book_num"));
		
		reserve_dao dao = reserve_dao.getInstance();
		int reservedelete = dao.delete(id, book_num);
		System.out.println("reservedelete:"+reservedelete);
		
		List<reserve_dto> reservedeletelist = dao.getreserveList(id);
		System.out.println("reservedeletelist:" + reservedeletelist);
		
		request.setAttribute("reservedelete", reservedelete);
		request.setAttribute("reservedeletelist", reservedeletelist);
		
		ActionForward forward=new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./member/reserveList.jsp");
		
		return forward;
	}

}
