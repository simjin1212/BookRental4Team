package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.member_board_dao;
import dto.member_board_dto;

public class member_board_delete implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("delete");
		
		int num = Integer.parseInt(request.getParameter("num"));
		String path = request.getRealPath("mb_upload");
		

		member_board_dao dao=member_board_dao.getInstance();
		member_board_dto board=dao.getDetail(num);
		int result=dao.delete(board, num, path);
		
		if(result==1) System.out.println("삭제 성공");		
		
		ActionForward forward=new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/member_board_list.do");
		return forward;
	}

}
