package service;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.member_dao;
import dto.member_dto;

public class Delete implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("Delete");
		
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("utf-8");
		
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		
		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");
		
		member_dao dao = member_dao.getInstance();
		member_dto old = dao.getMember(id);	// 1명의 상세정보 구하기
		
		// 비번 비교
		if(old.getPasswd().equals(passwd)) {	//  비번 일치시
			int result = dao.delete(id);		// delete SQL문 실행
			if(result == 1) System.out.println("회원탈퇴 성공");
			
			session.invalidate();               // 세션 삭제
			
		}else {		// 비번 불일치시
			out.println("<script>");
			out.println("alert('비번이 일치하지 않습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			
			return null;
		}
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
//		forward.setPath("/LoginForm.do");
		forward.setPath("./member/loginform.jsp");
		
		return forward;
	}

}
