package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



import dao.qna_board_dao;

import dto.qna_board_dto;

public class qna_board_reply implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
System.out.println("reply");
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		int grade=(int)session.getAttribute("member_grade");
		String page=request.getParameter("page");
		
		
		qna_board_dto board=new qna_board_dto();
		
		board.setId(id);
		board.setQb_num(Integer.parseInt(request.getParameter("qb_num")));
		board.setQb_subject(request.getParameter("qb_subject"));
		board.setQb_content(request.getParameter("qb_content"));
		board.setQb_ref(Integer.parseInt(request.getParameter("qb_ref")));
		board.setQb_lev(Integer.parseInt(request.getParameter("qb_lev")));
		board.setQb_seq(Integer.parseInt(request.getParameter("qb_seq")));
		
		
		qna_board_dao dao= qna_board_dao.getInstance();
		int result=dao.boardReply(board);
		
		
		if(result==1) System.out.println("답글 작성됨");
		
		ActionForward forward=new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/qna_BoardListAction.do");
		return forward;
	}
}


