package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.review_board_dao;
import dto.review_board_dto;

public class review_board_detailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("review_Board_DetailAction");

		int board_num = Integer.parseInt(request.getParameter("board_num"));
		int book_num = Integer.parseInt(request.getParameter("num"));
		String page = request.getParameter("page");

		review_board_dao dao = review_board_dao.getInstance();
		dao.readcountUpdate(board_num); // 조회수 증가
		review_board_dto board = dao.getDetail(board_num); // 상세정보 구하기

		String content = board.getRb_Content().replace("\n", "<br>");

		String sDownloadPath = request.getRealPath("rb_upload");
		String sFilePath = sDownloadPath + "\\"; // + "\\" + board.getUpload();
		System.out.println("sFilePath=" + sFilePath);

		request.setAttribute("book_num", book_num);
		request.setAttribute("board", board);
		request.setAttribute("page", page);
		request.setAttribute("content", content);

		ActionForward forward = new ActionForward();
		forward.setRedirect(false); // dispatcher 방식으로 포워딩
		forward.setPath("./book/book_review_view.jsp");

		return forward;
	}

}
