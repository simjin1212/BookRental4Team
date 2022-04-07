package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class member_board_login implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("member_board_login");
		
		String id="toto";
		String grade="member";
		
		HttpSession session = request.getSession();	//session 객체 생성
		session.setAttribute("id", id);
		session.setAttribute("grade", grade);
		
		ActionForward forward=new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./index.jsp");
		return forward;
	}

}
