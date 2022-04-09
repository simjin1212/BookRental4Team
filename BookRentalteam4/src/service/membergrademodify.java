package service;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.member_dao;



public class membergrademodify implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		String id = request.getParameter("id");
		int member_grade = Integer.parseInt(request.getParameter("member_grade"));
		System.out.println("id:"+id);
		System.out.println("memgrade : "+member_grade);
		
		member_dao dao = member_dao.getInstance();	
		int result = dao.membermodify(id, member_grade);			 // ID중복검사	
		System.out.println("result:" + result);	 // 1 : 변경완료
		                              
		// 웹브라우저에 출력되는 값이 callback 함수로 리턴된다.
		out.println(result);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);  				// dispatcher 방식 포워딩
		forward.setPath("/admin_memberdetail.do");  // 포워딩할 파일명
		
		return forward;
		
		
	}
}
