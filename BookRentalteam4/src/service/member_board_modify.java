package service;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.member_board_dao;
import dto.member_board_dto;

public class member_board_modify implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("modify");
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");

		String path = request.getRealPath("mb_upload");
		System.out.println("path:"+path);
		int size = 10*1024 * 1024;		// 첨부파일의 크기(단위:Byte) : 1MB
		
		// 첨부파일은 MulipartRequest클래스로 객체를 생성하면서 업로드가 된다.
		MultipartRequest multi = 
					new MultipartRequest(request,
										 path,	   // 업로드 디렉토리 위치
										 size,	   // 첨부파일의 크기 : 1MB
										 "utf-8",  // 인코딩 타입 설정
					new DefaultFileRenamePolicy());// 중복 문제 해결
		
		int num = Integer.parseInt(multi.getParameter("mb_num"));
		String page=multi.getParameter("page");

		member_board_dao dao=member_board_dao.getInstance();
		member_board_dto old=dao.getDetail(num);
		
		member_board_dto mb=new member_board_dto();
		mb.setMb_Num(num);
		mb.setMb_Subject(multi.getParameter("mb_subject"));
		mb.setMb_Content(multi.getParameter("mb_content"));
		
		String mb_file = multi.getFilesystemName("mb_file");
		if(mb_file != null){					// 첨부 파일을 수정한 경우
			mb.setMb_File(mb_file);
		}else{								// 첨부 파일을 수정하지 않은 경우
			mb.setMb_File(old.getMb_File());
		}
		
		int result=dao.update(mb, old.getMb_File(), path);
		if(result==1) System.out.println("수정 성공");
		
		ActionForward forward=new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/member_board_view.do?num="+num+"&page="+page);
		return forward;
	}

}
