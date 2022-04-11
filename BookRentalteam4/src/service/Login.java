
package service;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

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
		
		int admincheck = dao.admincheck(id);	//관리자 체크
		
		int result = dao.memberAuth(id, passwd);	// 회원인증
		

		System.out.println("admincheck : "+admincheck);
		
		if(result == 1) System.out.println("회원 인증 성공");
		
		
	//	location.href="./loginform.do";
		if(result == 1 && admincheck == 1) {
			
			request.setAttribute("admincheck", admincheck);
			session.setAttribute("id", id);         // 세션 공유 설정
			session.setAttribute("member_grade", 1);
//			JOptionPane aa = new JOptionPane();
//			aa.showMessageDialog(null,"관리자로 접속합니다!");
//			
//			ActionForward forward = new ActionForward();
//			forward.setRedirect(false);    			// dispatcher 방식으로 포워딩
//			forward.setPath("./admin/admin_main.jsp");   // 포워딩할 파일 설정
			
//			return forward;
			
		}else if(result == 1 && admincheck == -1){
			request.setAttribute("admincheck", admincheck);
			// 회원 인증 성공
			session.setAttribute("id", id);         // 세션 공유 설정
			session.setAttribute("member_grade", 0);
			
		}else {					// 회원 인증 실패
				out.println("<script>");
				out.println("alert('로그인 실패');");
				out.println("history.go(-1);");
				out.println("</script>");
			
				return null;
		}	
		
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);    			// dispatcher 방식으로 포워딩
//		forward.setPath("./member/main.jsp");   // 포워딩할 파일 설정
		forward.setPath("./member/premain.jsp");   // 포워딩할 파일 설정
		
		return forward;
	}

}

