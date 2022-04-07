package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.member_board_dao;
import dto.member_board_dto;

public class member_board_view implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("view");
		
		int num = Integer.parseInt(request.getParameter("num"));
		String nowpage=request.getParameter("page");

		member_board_dto board=new member_board_dto();
		member_board_dao dao=member_board_dao.getInstance();

		dao.readcountUpdate(num); //조회수 증가
		board = dao.getDetail(num); //상세정보 구하기

		String content = board.getMb_Content().replace("\n", "<br>"); //본문 출력 형식
		
		//저장된 첨부파일 주소
		   String sDownloadPath = request.getRealPath("mb_upload");
		   String sFilePath = sDownloadPath+"\\"; //+ "\\" + board.getUpload();
		   System.out.println("sFilePath="+sFilePath); 
		   
			//servlet 단위로 이동---> request 영역으로 공유
			request.setAttribute("page", nowpage);
			request.setAttribute("board", board);
			request.setAttribute("content", content);
		
		ActionForward forward=new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./member_board/member_board_view.jsp");
		return forward;
	}

}
