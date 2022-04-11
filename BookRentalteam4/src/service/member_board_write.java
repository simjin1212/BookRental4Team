package service;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.member_board_dao;
import dto.member_board_dto;

public class member_board_write implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("write");
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");

		String path=request.getRealPath("mb_upload");
		int size=10*1024*1024;
		System.out.println("path: "+path);
		
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		int grade=(int)session.getAttribute("member_grade");
		
		MultipartRequest multi=new MultipartRequest(request,
																	path, //업로드 경로
																	size, //파일 크기
																	"utf-8", //파일명 (한글일 경우) 인코딩
																	new DefaultFileRenamePolicy()); //중복 파일명 해결
		
		member_board_dto mb=new member_board_dto();
		mb.setId(id);
		mb.setMb_Subject(multi.getParameter("mb_subject"));
		mb.setMb_Content(multi.getParameter("mb_content"));
		mb.setMb_File(multi.getFilesystemName("mb_file"));
		mb.setMb_Grade(grade);
		
		member_board_dao dao=member_board_dao.getInstance();
		
		int result=dao.insert(mb);
		
		if(result==1) System.out.println("글 작성됨");
		
		ActionForward forward=new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/member_board_list.do");
		return forward;
	}

}
