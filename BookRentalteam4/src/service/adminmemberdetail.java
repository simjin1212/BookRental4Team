package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.book_dao;
import dao.member_dao;
import dto.book_dto;
import dto.member_dto;

public class adminmemberdetail implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("adminmemberdetailaction");
		String id = request.getParameter("id");
		String page = request.getParameter("page");
		
		member_dao dao = member_dao.getInstance();
		member_dto member = dao.getMember(id); // 상세정보 구하기
		
		// 글내용에서 줄바꿈
		//String content = book.getWirter_Talks().replace("\n","<br>");
		
		// 공유 설정
		request.setAttribute("member", member);
		request.setAttribute("page", page);
		//request.setAttribute("content", content);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);  		// dispatcher 방식으로 포워딩
		forward.setPath("./admin/admin_memberdetail.jsp");
		
		return forward;
	}

}


