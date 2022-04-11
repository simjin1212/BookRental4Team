package service;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.rent_dao;

public class returnbook implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("return book");
		
		int num=Integer.parseInt(request.getParameter("num"));
		
		rent_dao dao=rent_dao.getInstance();
		int result=dao.returnbook(num);
		
		if(result!=1) {
			result=-1;
		}
		request.setAttribute("result", result);
		
		ActionForward forward=new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./member/returnalert.jsp");
		return forward;
	}

}
