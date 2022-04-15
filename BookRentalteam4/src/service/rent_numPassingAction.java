package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.book_dao;

public class rent_numPassingAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub

		System.out.println("rentPassing 작동  ");
		
		request.setCharacterEncoding("utf-8");
		int b_num = Integer.parseInt(request.getParameter("book_Num"));
		int r_num = Integer.parseInt(request.getParameter("rent_num"));
		
		System.out.println("b num:" + b_num);
		System.out.println("r num:" + r_num);
		
		book_dao dao = book_dao.getInstance();
		String book = dao.getMatching(b_num);
		System.out.println("book:"+book);
		 
		request.setAttribute("book", book);
		request.setAttribute("b_num", b_num);
		request.setAttribute("r_num", r_num);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/BookWriteFormAction.do");
		return forward;
	}

}
