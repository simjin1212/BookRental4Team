package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
 
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.member_board_dao;
import dto.member_board_dto;

public class member_board_reply implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("reply");
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String path=request.getRealPath("mb_upload");
		int size=10*1024*1024;
		System.out.println("path: "+path);
		
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		int grade=(int)session.getAttribute("member_grade");
		String page=request.getParameter("page");
		
		MultipartRequest multi=new MultipartRequest(request, path, size, "utf-8", new DefaultFileRenamePolicy()); 
		
		member_board_dto board=new member_board_dto();
		board.setMb_Num(Integer.parseInt(multi.getParameter("mb_num")));
		board.setId(id);
		board.setMb_Subject(multi.getParameter("mb_subject"));
		board.setMb_Content(multi.getParameter("mb_content"));
		board.setMb_File(multi.getFilesystemName("mb_file"));
		board.setMb_REF(Integer.parseInt(multi.getParameter("mb_ref")));
		board.setMb_LEV(Integer.parseInt(multi.getParameter("mb_lev")));
		board.setMb_SEQ(Integer.parseInt(multi.getParameter("mb_seq")));
		board.setMb_Grade(grade);
		
		member_board_dao dao=member_board_dao.getInstance();
		int result=dao.boardReply(board);
		
		if(result==1) System.out.println("답글 작성됨");
		
		ActionForward forward=new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/member_board_list.do");
		return forward;
	}

}
