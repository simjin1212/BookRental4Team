package service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.reserve_dao;
import dto.reserve_dto;

public class reservelistaction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("reservelistaction");
		
		request.setCharacterEncoding("utf-8");
		 
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");

		reserve_dao dao = reserve_dao.getInstance();
		
		List<reserve_dto> reservelist = dao.getreserveList(id);
		System.out.println("id:"+id);
		System.out.println("reservelist:" + reservelist);
	
		request.setAttribute("reservelist", reservelist);
		
		ActionForward forward=new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./member/reserveList.jsp");
		
		return forward;
	}

}
