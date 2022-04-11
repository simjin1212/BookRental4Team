package service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.rent_dao;
import dto.rent_dto;
 
public class admin_rentlist implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("admin_rentlist");
		
		rent_dao dao=rent_dao.getInstance();
		int rentcount=dao.getCount();

		int page=1;  //default 페이지 번호 -- 현재 페이지값 넘어온게 없으면 1페이지로 가도록
		int tb_limit=20;  //페이지 당 출력되는 게시글 수
		
		if(request.getParameter("page")!=null) {	//페이지 값 넘어온 게 있으면 그 페이지로 갈 것
			page=Integer.parseInt(request.getParameter("page"));	//형변환 필요
		}
		
		int startRow=(page-1)*tb_limit +1;	//페이지 당 출력될 첫 번째 게시글 번호(rnum)
		int endRow=page*tb_limit;				//페이지 당 출력될 마지막 게시글 번호(rnum)
		
		List<rent_dto> rent_list=new ArrayList<rent_dto>();
		rent_list=dao.adminRentList(startRow, endRow);
		
		System.out.println("rent_list:"+rent_list);
		
		int pageCount=rentcount/tb_limit+ ((rentcount%tb_limit==0)? 0:1);
		int startPage=((page-1)/10)*10+1;  //페이지 블럭 1,11,21...
		int endPage=startPage+10 -1;  //페이지 블럭 10,21,31...
		
		if(endPage>pageCount) {
			endPage=pageCount;
		}
		
		request.setAttribute("rentcount", rentcount);	//총 글 수
		request.setAttribute("page", page); 	//페이지값
		request.setAttribute("rentlist", rent_list); 		//글 목록
		request.setAttribute("pageCount", pageCount); //전체 페이지 수
		request.setAttribute("startPage", startPage); 	//블록 당 시작 페이지번호
		request.setAttribute("endPage", endPage); 		//블록 당 끝 페이지번호
		
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./admin/admin_rentlist.jsp");
		return forward;
	}
}
