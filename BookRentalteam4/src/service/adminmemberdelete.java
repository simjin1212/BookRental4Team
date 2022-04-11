package service;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import dao.member_dao;





public class adminmemberdelete implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
System.out.println("Delete");
		
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("utf-8");
		JOptionPane aa = new JOptionPane();
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		
		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");
		
		member_dao dao = member_dao.getInstance();
		int result = dao.delete(id);
		if(result ==1) {
			System.out.println("회원탈퇴성공");
		aa.showMessageDialog(null,"회원을 강제 탈퇴시켰습니다!");
		}
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/adminmemberlist.do");
		
		return forward;
	}

}
