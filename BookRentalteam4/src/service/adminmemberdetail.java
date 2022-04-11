package service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.book_dao;
import dao.member_dao;
import dao.rent_dao;
import dto.book_dto;
import dto.member_dto;
import dto.rent_dto;

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
		
		//대출 내역/건 구함
		rent_dao rent=rent_dao.getInstance();
		List<rent_dto> rentlist=new ArrayList<rent_dto>();
		
		rentlist=rent.getRentList(id);

		
		// 공유 설정
		request.setAttribute("member", member);
		request.setAttribute("page", page);
		request.setAttribute("rentlist", rentlist);
		//request.setAttribute("content", content);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);  		// dispatcher 방식으로 포워딩
		forward.setPath("./admin/admin_memberdetail.jsp");
		
		return forward;
	}

}


