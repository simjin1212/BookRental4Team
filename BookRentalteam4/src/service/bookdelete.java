package service;

import java.io.File;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import dao.book_dao;
import dto.book_dto;

public class bookdelete implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
System.out.println("bookDelete");
		
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("utf-8");
		
		PrintWriter out = response.getWriter();
		
		int book_Num = Integer.parseInt(request.getParameter("book_Num"));
		String page = request.getParameter("page");
		
		String path = request.getRealPath("bookcoverupload");
		System.out.println("path:"+ path);
		
		book_dao dao = book_dao.getInstance();
		book_dto old = dao.getDetail(book_Num);		// 상세정보 구하기
		
			int result = dao.delete(book_Num);	// delete SQL문 실행
			if(result == 1) System.out.println("삭제 성공");
			
			// 첨부파일이 있을 경우에 첨부파일 삭제
			if(old.getBook_Cover() != "") {
				
				File file = new File(path);
				file.mkdir();
				
				// boardupload 디렉토리의 모든 첨부파일 구해오기
				File[] f = file.listFiles();
				for(int i=0; i<f.length; i++) {
					if(f[i].getName().equals(old.getBook_Cover())) {
						f[i].delete();
						
					}
				}				
			}
			JOptionPane aa = new JOptionPane();
			aa.showMessageDialog(null,"도서 삭제 성공!");
			
		
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/booklistaction.do");
		
		return forward;
	}

}
