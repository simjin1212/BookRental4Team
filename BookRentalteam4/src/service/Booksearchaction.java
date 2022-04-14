package service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.book_dao;
import dto.book_dto;

public class Booksearchaction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("Booksearch");

		int page = 1; // 페이지 번호
		int limit = 10; // 한 페이지에 출력할 데이터 갯수


		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}

		int startRow = (page - 1) * limit + 1;
		int endRow = page * limit;

		book_dao dao = book_dao.getInstance();
		int listcount = dao.getCount(); // 총 데이터 갯수
		System.out.println("listcount :" + listcount);

		List<book_dto> booklist = dao.getList(); // 서브쿼리 두번작성해야함
		System.out.println("booklist :" + booklist);
		// 총 페이지
		int pageCount = listcount / limit + ((listcount % limit == 0) ? 0 : 1);

		int startPage = ((page - 1) / 10) * limit + 1; // 1, 11, 21...
		int endPage = startPage + 10 - 1; // 10, 20, 30...

		if (endPage > pageCount)
			endPage = pageCount;
		
		
		
		request.setAttribute("page", booklist);
		request.setAttribute("listcount", listcount);
		request.setAttribute("booklist", booklist);
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);

		ActionForward forward = new ActionForward();
		forward.setRedirect(false); // dispatcher 방식으로 포워딩
		forward.setPath("./book/book_search.jsp");

		return forward;
	}

}
