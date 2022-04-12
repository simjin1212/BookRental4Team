package service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.rent_dao;
import dto.rent_dto;

public class rentListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("rentListAction 작동");
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		
		/*
		 * int page = 1; // 현재 페이지 번호 int limit = 10; // 한 페이지에 출력할 데이터 갯수
		 * 
		 * if(request.getParameter("page") != null) { page =
		 * Integer.parseInt(request.getParameter("page")); }
		 */
		
		rent_dao dao = rent_dao.getInstance();
		int rentcount = dao.regetCount(id);
		System.out.println("rentcount:"+rentcount);
		
		List<rent_dto> rentlist = dao.getRentList(id);
		System.out.println("rentlist:" + rentlist);
		
		request.setAttribute("rentcount", rentcount);
		request.setAttribute("rentlist", rentlist);
		
		ActionForward forward=new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./member/rentList.jsp");
		
		return forward;
	}

}
