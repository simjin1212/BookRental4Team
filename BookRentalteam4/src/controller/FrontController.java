package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.Action;
import service.ActionForward;
import service.Booksearchaction;
import service.Delete;
import service.Idcheck;
import service.Login;
import service.ReviewListAction;
import service.Update;
import service.UpdateMember;
import service.adminmemberdelete;
import service.adminmemberdetail;
import service.adminmemberlist;
import service.bookModify;
import service.bookModifyAction;
import service.bookdelete;
import service.bookdetailaction;
import service.booklistaction;
import service.bookreview_write;
import service.bookupdateAction;
import service.memberJoin;
import service.member_board_delete;
import service.member_board_list;
import service.member_board_modify;
import service.member_board_modifyAction;
import service.member_board_multidel;
import service.member_board_reply;
import service.member_board_replyAction;
import service.member_board_view;
import service.member_board_write;
import service.memberbookdetail;
import service.membergrademodify;
import service.qna_BoardAddAction;
import service.qna_BoardDetailAction;
import service.qna_BoardListAction;
import service.qna_BoardModify;
import service.qna_BoardModifyAction;
import service.qna_board_reply;
import service.qna_board_replyAction;
import service.rentListAction;

@WebServlet("*.do") // do 확장자로 요청하는 요청을 받겠다는 의미
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// doGet(), doPost() 메소드에서 공통적인 작업을 처리하는 메소드
	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = requestURI.substring(contextPath.length());

		System.out.println("requestURI:" + requestURI);
		System.out.println("contextPath:" + contextPath);
		System.out.println("command:" + command);

		Action action = null;
		ActionForward forward = null;

		// 도서등록
		if (command.equals("/bookupdate.do")) {
			try {
				action = new bookupdateAction();
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/bookupdateform.do")) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./admin/admin_bookupdate.jsp");
			// 도서 리스트
		} else if (command.equals("/booklistaction.do")) {
			try {
				action = new booklistaction();
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

			// 도서 검색 리스트
		} else if (command.equals("/booksearchaction.do")) {
			try {
				action = new Booksearchaction();
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

			// 회원 도서 상세

		} else if (command.equals("/memberbookdetail.do")) {
			try {
				action = new memberbookdetail();
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			// 도서 상세
		} else if (command.equals("/bookDetailAction.do")) {
			try {
				action = new bookdetailaction();
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			// 도서 상세
		} else if (command.equals("/bookDetailAction.do")) {
			try {
				action = new bookdetailaction();
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

			// 도서수정폼
		} else if (command.equals("/bookModifyAction.do")) {
			try {
				action = new bookModifyAction();
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

			// 도서 수정!
		} else if (command.equals("/bookModify.do")) {
			try {
				action = new bookModify();
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			// 도서삭제!!
		} else if (command.equals("/bookDelete.do")) {
			try {
				action = new bookdelete();
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		// 도서 검색
		if (command.equals("/Booksearch.do")) {
			try {
				action = new Booksearchaction();
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		// 회원 가입
		if (command.equals("/memberjoin.do")) {
			try {
				action = new memberJoin();
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			// ID중복 검사(ajax)
		} else if (command.equals("/Idcheck.do")) {
			try {
				action = new Idcheck();
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

			// 회원가입 폼
		} else if (command.equals("/joinform.do")) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./member/joinform.jsp");

			// 로그인(회원인증)
		} else if (command.equals("/Login.do")) {
			try {

				action = new Login();
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			// 로그 아웃
		} else if (command.equals("/Logout.do")) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./member/logout.jsp");

			// 로그인 폼
		} else if (command.equals("/loginform.do")) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./member/loginform.jsp");

			// 대출 목록
		} else if (command.equals("/RentList.do")) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./member/rentList.jsp");

			// 예약 목록
		} else if (command.equals("/ReserveList.do")) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./member/reserveList.jsp");

			// 내 정보 보기
		} else if (command.equals("/UpdateForm.do")) {
			try {
				action = new UpdateMember();
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			// 회원정보 수정
		} else if (command.equals("/Update.do")) {
			try {
				action = new Update();
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			// 회원탈퇴 폼
		} else if (command.equals("/DeleteMember.do")) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./member/deleteform.jsp");

			// 회원 탈퇴
		} else if (command.equals("/Delete.do")) {
			try {
				action = new Delete();
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

			// 리뷰 작성폼
		} else if (command.equals("/BookReview_Form.do")) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./book/book_review_write.jsp");
			// 리뷰 작성
		} else if (command.equals("/bookreview_write.do")) {
			try {
				action = new bookreview_write();
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			// 리뷰게시판 이동
		} else if (command.equals("/ReviewListAction.do")) {
			try {
				action = new ReviewListAction();
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		// 리뷰게시판 이동
		else if (command.equals("/rentListAction.do")) {
			try {
				action = new rentListAction();
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		// 관리자 -회원리스트
		if (command.equals("/adminmemberlist.do")) {
			try {
				action = new adminmemberlist();
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			// 관리자-멤버상세
		} else if (command.equals("/admin_memberdetail.do")) {
			try {
				action = new adminmemberdetail();
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			// 관리자-멤버 강퇴
		} else if (command.equals("/memberdelete.do")) {
			try {
				action = new adminmemberdelete();
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/membergrademodify.do")) {
			try {
				action = new membergrademodify();
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		// 이하 멤버(자유)게시판
		// 리스트
		if (command.contentEquals("/member_board_list.do")) {
			try {
				action = new member_board_list();
				forward = action.execute(request, response);

			} catch (Exception e) {
				e.printStackTrace();
			}
			// 글작성 폼으로
		} else if (command.contentEquals("/member_board_writeform.do")) {
			try {
				forward = new ActionForward();
				forward.setRedirect(false);
				forward.setPath("./member_board/member_board_write.jsp");

			} catch (Exception e) {
				e.printStackTrace();
			}
			// 글 작성
		} else if (command.contentEquals("/member_board_write.do")) {
			try {
				action = new member_board_write();
				forward = action.execute(request, response);

			} catch (Exception e) {
				e.printStackTrace();
			}
			// 글 내용 보기
		} else if (command.contentEquals("/member_board_view.do")) {
			try {
				action = new member_board_view();
				forward = action.execute(request, response);

			} catch (Exception e) {
				e.printStackTrace();
			}
			// 글수정 폼으로
		} else if (command.contentEquals("/member_board_modifyform.do")) {
			try {
				action = new member_board_modifyAction();
				forward = action.execute(request, response);

			} catch (Exception e) {
				e.printStackTrace();
			}
			// 글 수정
		} else if (command.contentEquals("/member_board_modify.do")) {
			try {
				action = new member_board_modify();
				forward = action.execute(request, response);

			} catch (Exception e) {
				e.printStackTrace();
			}
			// 글삭제 페이지
		} else if (command.contentEquals("/member_board_deleteform.do")) {
			try {
				forward = new ActionForward();
				forward.setRedirect(false);
				forward.setPath("./member_board/member_board_delete.jsp");

			} catch (Exception e) {
				e.printStackTrace();
			}
			// 글삭제
		} else if (command.contentEquals("/member_board_delete.do")) {
			try {
				action = new member_board_delete();
				forward = action.execute(request, response);

			} catch (Exception e) {
				e.printStackTrace();
			}
			// 답글 폼으로
		} else if (command.contentEquals("/member_board_replyform.do")) {
			try {
				action = new member_board_replyAction();
				forward = action.execute(request, response);

			} catch (Exception e) {
				e.printStackTrace();
			}
			// 답글 입력
		} else if (command.contentEquals("/member_board_reply.do")) {
			try {
				action = new member_board_reply();
				forward = action.execute(request, response);

			} catch (Exception e) {
				e.printStackTrace();
			}
			// 다중 삭제
		} else if (command.contentEquals("/member_board_multidel.do")) {
			try {
				action = new member_board_multidel();
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			} // member_board_multidel.do }
		}

		// ------------------------------------------아래부터
		// 문의항목------------------------------------------
		// qna문의작성(원문작성)
		if (command.equals("/qna_BoardAddAction.do")) {
			try {
				action = new qna_BoardAddAction();
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

			// qna문의작성 폼1
		} else if (command.equals("/qna_BoardForm.do")) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./qna_board/qna_board_write.jsp");

			// qna문의글목록
		} else if (command.equals("/qna_BoardListAction.do")) {

			try {
				action = new qna_BoardListAction();
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

			// qna문의상세 페이지
		} else if (command.equals("/qna_BoardDetailAction.do")) {
			try {
				action = new qna_BoardDetailAction();
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

			// qna문의수정 폼
		} else if (command.equals("/qna_BoardModifyAction.do")) {
			try {
				action = new qna_BoardModifyAction();
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

//				//qna문의글 수정
		}else if (command.equals("/qna_BoardModify.do")) {
			try {
				action = new qna_BoardModify();
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			//qna답글 폼
		}else if (command.contentEquals("/qna_board_replyform.do")) {
		try {
			action = new qna_board_replyAction();
			forward = action.execute(request, response);

		} catch (Exception e) {
			e.printStackTrace();
		}
		// 답글 입력
	    }else if (command.contentEquals("/qna_board_reply.do")) {
		try {
			action = new qna_board_reply();
			forward = action.execute(request, response);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

		// 포워딩 처리
		if (forward != null) {
			if (forward.isRedirect()) { // redirect 방식으로 포워딩
				response.sendRedirect(forward.getPath());
			} else { // dispatcher 방식으로 포워딩
				RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
		}

	} // doProcess() end

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("get");

		doProcess(request, response); // doProcess() 메소드 호출
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("post");

		doProcess(request, response); // doProcess() 메소드 호출
	}

}