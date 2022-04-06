package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.member_dao;
import dto.member_dto;

public class UpdateMember implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("UpdateMember");
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		
		member_dao dao = member_dao.getInstance();
		member_dto member = dao.getMember(id);	// 1명의 상세정보 구하기
		System.out.println("수정폼:"+ member);
		
		// 공유 설정
		request.setAttribute("member", member);
		
		ActionForward forward = new ActionForward();
		
		// request객체로 공유를  한 경우에는 dispatcher방식으로 포워딩을 해야
		// view 페이지에서 공유한 값에 접근할 수 있다.
		forward.setRedirect(false);   		// dispatcher방식으로 포워딩
		forward.setPath("./member/updateform.jsp");
		
		return forward;
	}

}
