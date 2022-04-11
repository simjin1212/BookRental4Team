package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.qna_board_dao;
import dto.qna_board_dto;


public class qna_BoardDetailAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("BoardDetailAction");
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		int grade=(int)session.getAttribute("member_grade");
		int qb_num = Integer.parseInt(request.getParameter("qb_num"));
		
		System.out.println("qb_num==>" + qb_num);
		String page = request.getParameter("page");
		qna_board_dao dao = qna_board_dao.getInstance();
		qna_board_dto board = dao.getDetail(qb_num); // 상세정보 구하기
		
		// 글내용에서 줄바꿈
		//String content = board.getBoard_content().replace("\n","<br>");
		
		// 공유 설정
		request.setAttribute("board", board);
//		request.setAttribute("content", content);
		request.setAttribute("page", page);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);  		// dispatcher 방식으로 포워딩
		forward.setPath("./qna_board/qna_board_view.jsp");
		
		return forward;
	}

}
