package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import dao.member_dao;
import dto.member_dto;

public class memberJoin implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("memberjoin");
		
		request.setCharacterEncoding("utf-8");
		
		member_dto member = new member_dto();
		member.setId(request.getParameter("id"));
		member.setPasswd(request.getParameter("passwd"));
		member.setName(request.getParameter("name"));
		member.setJumin(request.getParameter("jumin"));
		member.setJumin2(request.getParameter("jumin2"));
		member.setMailid(request.getParameter("mailid"));
		member.setDomain(request.getParameter("domain"));
		member.setPhone1(request.getParameter("phone1"));
		member.setPhone2(request.getParameter("phone2"));
		member.setPhone3(request.getParameter("phone3"));
		member.setPost(request.getParameter("post"));
		member.setAddress(request.getParameter("address"));
		
		
		member_dao dao = member_dao.getInstance();
		int result = dao.insert(member);	// 회원 가입
		if(result == 1)	System.out.println("회원가입 성공");
		JOptionPane aa = new JOptionPane();
		aa.showMessageDialog(null,"회원가입 성공!");
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);  				// dispatcher 방식 포워딩
		forward.setPath("./member/loginform.jsp");  // 포워딩할 파일명
		
		return forward;
	}


}
