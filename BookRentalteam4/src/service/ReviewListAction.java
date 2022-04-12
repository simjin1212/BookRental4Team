package service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.book_dao;
import dao.review_board_dao;
import dto.book_dto;
import dto.review_board_dto;

public class ReviewListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("작동완료");

		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");

		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		
		//도서 상세파트의 책 번호
		int book_Num = Integer.parseInt(request.getParameter("num"));
		
		
		System.out.println("id:" + id);
		System.out.println("book_Num:" + book_Num);
		
		book_dao bkdao = book_dao.getInstance();
		book_dto book = bkdao.getDetail(book_Num); // 상세정보 구하기
		int rentcheck = bkdao.rentcheck(book_Num);
		
		//도서 대여번호 구하기(rent)에서 사용
		int rent = bkdao.rent(book_Num);
		
		int page = 1;
		int limit = 10;

		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		int startRow = (page - 1) * limit + 1;
		int endRow = page * limit;
		
		//리뷰
		review_board_dao dao = review_board_dao.getInstance();
		int reviewlistcount = dao.rlgetCount();
		System.out.println("reviewlistcount:" + reviewlistcount);

		List<review_board_dto> reviewlist = dao.getList(startRow, endRow, id);
		System.out.println("reviewlist:" + reviewlist);

		int pageCount = reviewlistcount / limit + ((reviewlistcount % limit == 0) ? 0 : 1);

		int startPage = ((page - 1) / 10) * limit + 1;
		int endPage = startPage + 10 - 1;

		if (endPage > pageCount)
			endPage = pageCount;
		request.setAttribute("page", page);
		request.setAttribute("reviewlistcount", reviewlistcount);
		request.setAttribute("reviewlist", reviewlist);
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		System.out.println("rent:"+rent);
		request.setAttribute("rentcheck", rentcheck);
		request.setAttribute("rent", rent);
		request.setAttribute("page", page);
		
		request.setAttribute("book", book);
		request.setAttribute("book_Num", book_Num);

		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./book/book_review_list.jsp");

		return forward;
	}

}
