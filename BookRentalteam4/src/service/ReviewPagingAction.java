package service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.review_board_dao;
import dto.review_board_dto;

public class ReviewPagingAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		System.out.println("작동완료");

		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");

		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		
	
		int page = 1;
		int limit = 10;

		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}

		int startRow = (page - 1) * limit + 1;
		int endRow = page * limit;

		review_board_dao dao = review_board_dao.getInstance();
		int reviewlistcount = dao.rlgetCount();
		System.out.println("reviewlistcount:" + reviewlistcount);

		List<review_board_dto> reviewlist = dao.getList(startRow, endRow, id);
		System.out.println("reviewlist:" + reviewlist);

		int pageCount = reviewlistcount / limit + ((reviewlistcount % limit == 0) ? 0 : 1);

		int startPage = ((page - 1) / 10) * limit + 1;
		int endPage = startPage + 10 - 1;

		System.out.println("page:" + page);
		System.out.println("startpage:" + startPage);
		System.out.println("endpage:" + endPage);

		if (endPage > pageCount)
			endPage = pageCount;
		request.setAttribute("page", page);
		request.setAttribute("reviewlistcount", reviewlistcount);
		request.setAttribute("reviewlist", reviewlist);
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./book/book_review_list.jsp");

		return forward;
	}

}
