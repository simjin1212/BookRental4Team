package service;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.member_board_dao;
import dto.member_board_dto;

public class member_board_list implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("list");
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		int grade=(int)session.getAttribute("member_grade");

		
		member_board_dao dao=member_board_dao.getInstance();
		
		//공지 게시판 dto 변수 mb_notice에 저장
		//mb_grade가 manager인 글만 최근 세개만 뽑아 내림차순으로 정렬하는 sql문 사용할 것
		//일반 게시판 페이지 변경돼도 무조건 최근 세개가 위에 출력되게 고정
		List<member_board_dto> nt_list=new ArrayList<member_board_dto>();
		nt_list=dao.getNTList(3);
		System.out.println("nt_list:"+nt_list);
		
		String sel = request.getParameter("sel");
		String find = request.getParameter("find");

		//일반 게시판
		
		int page=1;  //default 페이지 번호 -- 현재 페이지값 넘어온게 없으면 1페이지로 가도록
		int tb_limit=20;  //페이지 당 출력되는 게시글 수
		int listcount=0;		//총 게시글

		
		if(request.getParameter("page")!=null) {	//페이지 값 넘어온 게 있으면 그 페이지로 갈 것
			page=Integer.parseInt(request.getParameter("page"));	//형변환 필요
		}
		
			listcount=dao.getCount(sel, find);		//총 게시글 수
			System.out.println(listcount);
			
			int startRow=(page-1)*tb_limit +1;	//페이지 당 출력될 첫 번째 게시글 번호(rnum)
			int endRow=page*tb_limit;				//페이지 당 출력될 마지막 게시글 번호(rnum)
			
			List<member_board_dto> mb_list=new ArrayList<member_board_dto>();	//목록
			mb_list=dao.getMBList(startRow, endRow, sel, find);		//전체 리스트 출력
			System.out.println("mb_list:"+mb_list);

		
		//이하 하단 페이지 목록
		//전체 페이지 수
		int pageCount=listcount/tb_limit+ ((listcount%tb_limit==0)? 0:1);
		int startPage=((page-1)/10)*10+1;  //페이지 블럭 1,11,21...
		int endPage=startPage+10 -1;  //페이지 블럭 10,21,31...
		
		if(endPage>pageCount) {
			endPage=pageCount;
		}
		
		
		//페이지 정보를 request 영역으로 공유
		request.setAttribute("page", page); 	//현재 페이지 번호
		request.setAttribute("listcount", listcount); 		//총 게시글 수
		request.setAttribute("nt_list", nt_list);			//공지게시글 목록
		request.setAttribute("mb_list", mb_list); 		//일반게시글 목록
		request.setAttribute("pageCount", pageCount); //전체 페이지 수
		request.setAttribute("startPage", startPage); 	//블록 당 시작 페이지번호
		request.setAttribute("endPage", endPage); 		//블록 당 끝 페이지번호
		request.setAttribute("find", find);
		
		ActionForward forward=new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./member_board/member_board_list.jsp");
		return forward;
	}

}
