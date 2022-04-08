package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.member_board_dao;
import dto.member_board_dto;

public class member_board_replyAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("replyAction");
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		
		int num = Integer.parseInt(request.getParameter("num"));
		String page=request.getParameter("page");
		
		member_board_dao dao=member_board_dao.getInstance();
		member_board_dto board=dao.getDetail(num);
		
		request.setAttribute("board", board);	//request 영역으로 원글 dto 전달
		request.setAttribute("page", page);
		
		ActionForward forward=new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./member_board/member_board_reply.jsp");
		return forward;
	}

}
