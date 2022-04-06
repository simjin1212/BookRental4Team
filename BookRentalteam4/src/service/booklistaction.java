package service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.book_dao;
import dto.book_dto;

public class booklistaction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
	System.out.println("북리스트액션");
	book_dao dao= book_dao.getInstance();
	
	int listcount = dao.getCount();
	System.out.println(listcount);
	
	List<book_dto> booklist = dao.getList();
	
	request.setAttribute("listcount", listcount);
	request.setAttribute("booklist", booklist);
	
	
	// request 객체로 공유한 경우에는 dispatcher 방식으로 포워딩 되어야,
			// view 페이지에서 공유한 값에 접근 할 수 있다.
			ActionForward forward = new ActionForward();
			forward.setRedirect(false);    // dispatcher 방식으로 포워딩
			forward.setPath("./admin/admin_booklist.jsp");
			
	return forward;
	}

}
