package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.qna_board_dao;
import dto.qna_board_dto;



public class qna_board_replyAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("replyAction");
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		
		int qb_num = Integer.parseInt(request.getParameter("qb_num"));
		String page=request.getParameter("page");
		
		System.out.println("큡넙 : " + qb_num);
		
		qna_board_dao dao = qna_board_dao.getInstance();
		qna_board_dto board=dao.getDetail(qb_num);
		
		request.setAttribute("board", board);	//request 영역으로 원글 dto 전달
		request.setAttribute("page", page);
		request.setAttribute("qb_num", qb_num);
		
		ActionForward forward=new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./qna_board/qna_board_reply.jsp");
		return forward;
	}

}
