package service;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.qna_board_dao;
import dto.qna_board_dto;

public class qna_BoardModify implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("BoardModify");
		
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("utf-8");
		
		PrintWriter out = response.getWriter();
		
		int qb_num = Integer.parseInt(request.getParameter("qb_num"));
		String page = request.getParameter("page");
		
		qna_board_dto board = new qna_board_dto();
		board.setQb_num(qb_num);
		board.setQb_subject(request.getParameter("board_subject"));
		board.setQb_content(request.getParameter("board_content"));
		
		qna_board_dao dao = qna_board_dao.getInstance();
		qna_board_dto old = dao.getDetail(qb_num);	// 상세정보 구하기
		
		// 비번 비교
		 // 비번 일치시
			int result = dao.update(board);			 // update SQL문 실행
			if(result == 1) System.out.println("글수정 성공");
			
			
		
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
//		forward.setPath("/BoardListAction.do?page="+page);
		forward.setPath("/qna_BoardDetailAction.do?qb_num="+qb_num+"&page="+page);
		
		return forward;
	}

}
