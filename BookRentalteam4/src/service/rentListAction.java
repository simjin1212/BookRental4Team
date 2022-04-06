//package service;
//
//import java.util.List;
//
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//import dao.rent_dao;
//import dto.rent_dto;
//
//public class rentListAction implements Action {
//
//	@Override
//	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
//		// TODO Auto-generated method stub
//		System.out.println("rentListAction");
//		
//		int page = 1;		// 현재 페이지 번호
//		int limit = 10;		// 한 페이지에 출력할 데이터 갯수
//		
//		if(request.getParameter("page") != null) {
//			page = Integer.parseInt(request.getParameter("page"));
//		}
//		
//		// page =1 : startRow=1,  endRow=10
//		// page =2 : startRow=11, endRow=20
//		// page =3 : startRow=21, endRow=30
//		int startRow = (page - 1) * limit + 1;
//		int endRow = page * limit;
//		
////		rent_dao dao = rent_dao.getInstance();
////		int listcount = dao.getmemberlistCount();		// 총 데이터 갯수
////		System.out.println("listcount:" + listcount);
////		
////		List<rent_dto> boardlist = dao.getList(startRow, endRow);
////		System.out.println("boardlist:" + boardlist);
//		
//		// 총 페이지
////		int pageCount = listcount / limit+((listcount%limit==0) ? 0:1);
////		
////		int startPage = ((page-1)/10) * limit + 1;	// 1,  11, 21...
////		int endPage = startPage + 10 - 1;			// 10, 20, 30...
////		
////		if(endPage > pageCount) endPage = pageCount;
////		
////		request.setAttribute("page", page);
////		request.setAttribute("listcount", listcount);
////		request.setAttribute("boardlist", boardlist);
////		request.setAttribute("pageCount", pageCount);
////		request.setAttribute("startPage", startPage);
////		request.setAttribute("endPage", endPage);
////		
////		// request 객체로 공유한 경우에는 dispatcher 방식으로 포워딩 되어야,
////		// view 페이지에서 공유한 값에 접근 할 수 있다.
////		ActionForward forward = new ActionForward();
////		forward.setRedirect(false);    // dispatcher 방식으로 포워딩
////		forward.setPath("./service/rentlist.jsp");
////		
////		return forward;
//	}
////
//}
