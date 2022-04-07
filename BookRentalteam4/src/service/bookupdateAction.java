package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.book_dao;
import dto.book_dto;

public class bookupdateAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("bookupdateACtion");
		String path = request.getRealPath("bookcoverupload");
		System.out.println("path : "+path);
		
		int size = 1024*1024;
		
		MultipartRequest multi = 
				new MultipartRequest(request,
						path,
						size,
						"utf-8",
						new DefaultFileRenamePolicy());
		
		book_dto book = new book_dto();
		book.setBook_Name(multi.getParameter("book_name"));
		book.setGenre(multi.getParameter("genre"));
		book.setPublisher(multi.getParameter("publisher"));
		book.setBook_Cover(multi.getFilesystemName("book_cover"));
		book.setWriter(multi.getParameter("writer"));
		book.setWriter_talks(multi.getParameter("writer_talks"));
		
		
		book_dao dao = book_dao.getInstance();
		int result = dao.insert(book);	// 도서 작성
		if(result == 1)	System.out.println("도서기입 성공");
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);  				// dispatcher 방식 포워딩
		forward.setPath("/booklistaction.do");  // 포워딩할 파일명
		
		
		return forward;
	}

}
