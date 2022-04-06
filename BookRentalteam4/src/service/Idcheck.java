package service;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.member_dao;

public class Idcheck implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("Idcheck");
		
		request.setCharacterEncoding("utf-8");
		
		PrintWriter out = response.getWriter();
		
		String id = request.getParameter("id");
		System.out.println("id:"+id);
		
		member_dao dao = member_dao.getInstance();
		int result = dao.idcheck(id);			 // ID중복검사	
		System.out.println("result:" + result);	 // 1 : 중복 ID
		                                         //-1 : 사용 가능한 ID
		// 웹브라우저에 출력되는 값이 callback 함수로 리턴된다.
		out.println(result);
		
		return null;
	}

}
