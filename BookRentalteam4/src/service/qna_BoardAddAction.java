package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import dao.qna_board_dao;
import dto.qna_board_dto;

public class qna_BoardAddAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("BoardAddAction");
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		
		qna_board_dao dao = new qna_board_dao();
		qna_board_dto dto = new qna_board_dto();
		
		dto.setId(id);
		dto.setQb_subject(request.getParameter("qb_subject"));
		dto.setQb_content(request.getParameter("qb_content"));
		
		dao = qna_board_dao.getInstance();
		int result = dao.insert(dto);		// 원문 글작성
		if(result == 1) System.out.println("글작성 성공");
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/qna_BoardListAction.do");
		
		return forward;
	}

}
