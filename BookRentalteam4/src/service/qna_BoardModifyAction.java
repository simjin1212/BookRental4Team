package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.qna_board_dao;
import dto.qna_board_dto;

public class qna_BoardModifyAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("BoardModifyAction");
		
		int qb_num = Integer.parseInt(request.getParameter("qb_num"));
		String page = request.getParameter("page");
		
		qna_board_dao dao = qna_board_dao.getInstance();
		qna_board_dto dto = dao.getDetail(qb_num);	// 상세 정보 구하기
		
		// 공유 설정
		request.setAttribute("dto", dto);
		request.setAttribute("page", page);
		request.setAttribute("qb_num", qb_num);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);   // dispatcher 방식으로 포워딩
		forward.setPath("./qna_board/qna_board_modify.jsp");
		
		return forward;
	}

}
