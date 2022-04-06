package service;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.member_dao;

public class Login implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("Login");
		
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("utf-8");
		
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		
		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");
		
		member_dao dao = member_dao.getInstance();
		int result = dao.memberAuth(id, passwd);	// 회원인증
		if(result == 1) System.out.println("회원 인증 성공");
		
		if(result == 1) {		// 회원 인증 성공
			session.setAttribute("id", id);         // 세션 공유 설정
		}else {					// 회원 인증 실패
			out.println("<script>");
			out.println("alert('로그인 실패');");
			out.println("history.go(-1);");
			out.println("</script>");
			
			return null;
		}		
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);    			// dispatcher 방식으로 포워딩
		forward.setPath("./member/main.jsp");   // 포워딩할 파일 설정
		
		return forward;
	}

}
