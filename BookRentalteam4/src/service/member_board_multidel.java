package service;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.member_board_dao;

public class member_board_multidel implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("multidel");
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String page=request.getParameter("page");
		String[] mb_num=request.getParameterValues("chk"); //체크된 글번호 저장
		String path = request.getRealPath("mb_upload");
		
		member_board_dao dao= member_board_dao.getInstance();
		int result=dao.multidel(mb_num, path);
		
		if(result==mb_num.length) {		//글 갯수만큼 성공했으면
			System.out.println("다중 삭제 성공");
		} else {		//아닌 경우 메시지 띄우고 다시 리스트로 보냄
			PrintWriter out=response.getWriter();
			out.println("<script>");
			out.println("alert('삭제 실패했습니다');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			
			return null;
		}
		
		ActionForward forward=new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/member_board_list.do?page="+page);
		return forward;
	}

}
