package service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.rent_dao;
import dto.book_dto;
import dto.rent_dto;


public class review_writeAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		/*
		 * System.out.println("ReviewWriteACTION");
		 * request.setCharacterEncoding("utf-8");
		 * response.setContentType("text/html; charset=UTF-8");
		 * 
		 * int r_num = Integer.parseInt(request.getParameter("rent_Num")); rent_dao dao
		 * = rent_dao.getInstance();
		 * 
		 * List<book_dto> booklist = dao.getMatching(r_num);
		 * 
		 * request.setAttribute("r_num", r_num); request.setAttribute("booklist",
		 * booklist);
		 * 
		 * ActionForward forward = new ActionForward(); forward.setRedirect(false);
		 * forward.setPath("/book_review_writeAction.do");
		 */
		
		return null;
	}

}
