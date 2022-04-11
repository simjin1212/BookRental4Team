// DAO(Data Access Object)

package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.qna_board_dto;

public class qna_board_dao {
	
	// 싱글톤
	private static qna_board_dao instance = new qna_board_dao();

	public static qna_board_dao getInstance() {
		return instance;
	}
	
	// 컨넥션풀에서 컨넥션을 구해오는 메소드 
	private Connection getConnection() throws Exception{
		Context init = new InitialContext();
  		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/orcl");
  		return ds.getConnection();
	}
	
	// 글작성 : 원문작성
	public int insert(qna_board_dto dto) {
		int result = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = getConnection();
			
String sql="insert into QNA_BOARD values(qna_board_seq.nextval,?,?,?,sysdate,0,0,0)";
       
       		pstmt = con.prepareStatement(sql);
     		pstmt.setString(1, dto.getId());
     		pstmt.setString(2, dto.getQb_subject());
       		pstmt.setString(3, dto.getQb_content());
       		
			result = pstmt.executeUpdate();		// SQL문 실행
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt != null) try { pstmt.close();}catch(Exception e) {}
			if(con != null) try { con.close();}catch(Exception e) {}
 		}		
		return result;
	}
	
	// 총 데이터 갯수 구하기
		public int getCount() {
			int result = 0;
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			try {
				con = getConnection();
				
				String sql="select count(*) from qna_board";
				
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();		// SQL문 실행
				
				if(rs.next()) {
//					result = rs.getInt(1);
					result = rs.getInt("count(*)");
				}
				
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				if(rs != null) try { rs.close();}catch(Exception e) {}
				if(pstmt != null) try { pstmt.close();}catch(Exception e) {}
				if(con != null) try { con.close();}catch(Exception e) {}
			}		
			return result;
		}
	
	// 글목록
	public List<qna_board_dto> getList(int start, int end, int grade, String id){
		List<qna_board_dto> list = new ArrayList<qna_board_dto>();
		Connection con  = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = getConnection();
			if(grade == 1) {						//관리자 모든 글이 보이게 생성
String sql="select * from ( select rownum rnum, board.* from ";			
	   sql+=" ( select * from QNA_BOARD order by QB_REF desc, ";		
	   sql+=" QB_seq asc) board ) ";
	   sql+=" where rnum >= ? and rnum <= ?";
	   
	   		pstmt = con.prepareStatement(sql);
	   		pstmt.setInt(1, start);
	   		pstmt.setInt(2, end);
	   		rs = pstmt.executeQuery();		// SQL문 실행
	   		
	   		while(rs.next()) {
	   			qna_board_dto board = new qna_board_dto();
	   			
	   			board.setQb_num(rs.getInt("QB_NUM"));
	   			board.setQb_subject(rs.getString("QB_SUBJECT"));
	   			board.setId(rs.getString("id"));
	   			board.setQb_regdate(rs.getDate("qb_regdate"));
	
	   			list.add(board);
	   		}
			}else if(grade == 0) {						//일반회원 자신의 글만 보이게 생성
			
				String sql="select * from ( select rownum rnum, board.* from ";			
				   sql+=" ( select * from QNA_BOARD order by QB_REF desc, ";		
				   sql+=" QB_seq asc) board ) ";
				   sql+=" where rnum >= ? and rnum <= ? and id = ?";
				pstmt = con.prepareStatement(sql);
		   		pstmt.setInt(1, start);
		   		pstmt.setInt(2, end);
		   		pstmt.setString(3, id);
		   		rs = pstmt.executeQuery();		// SQL문 실행
		   		
				
		   		while(rs.next()) {
		   			qna_board_dto board = new qna_board_dto();
		   			
		   			board.setQb_num(rs.getInt("QB_NUM"));
		   			board.setQb_subject(rs.getString("QB_SUBJECT"));
		   			board.setId(rs.getString("id"));
		   			board.setQb_regdate(rs.getDate("qb_regdate"));
		
		   			list.add(board);
		   		}
				
			}
	   
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null) try { rs.close();}catch(Exception e) {}
			if(pstmt != null) try { pstmt.close();}catch(Exception e) {}
			if(con != null) try { con.close();}catch(Exception e) {}
		}		
		return list;
	}
	
	
	
	
	// 상세 페이지
	public qna_board_dto getDetail(int board_num) {
		qna_board_dto board = new qna_board_dto();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = getConnection();
			
			String sql="select * from QNA_BOARD where QB_NUM = ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, board_num);
			rs = pstmt.executeQuery();		// SQL문 실행
			
			if(rs.next()) {
				board.setQb_num(rs.getInt("qb_num"));
				board.setId(rs.getString("id"));
	   			board.setQb_subject(rs.getString("QB_SUBJECT"));
	   			board.setQb_content(rs.getString("QB_CONTENT"));
	   			board.setId(rs.getString("qb_ref"));
	   			board.setId(rs.getString("qb_lev"));
	   			board.setId(rs.getString("qb_seq"));
	   			
			/*	
	   			board.setBoard_name(rs.getString("board_name"));
	   			board.setBoard_pass(rs.getString("board_pass"));
	   			board.setBoard_subject(rs.getString("board_subject"));
	   			board.setBoard_content(rs.getString("board_content"));
	   			board.setBoard_file(rs.getString("board_file"));
	   			board.setBoard_re_ref(rs.getInt("board_re_ref"));
	   			board.setBoard_re_lev(rs.getInt("board_re_lev"));
	   			board.setBoard_re_seq(rs.getInt("board_re_seq"));
	   			board.setBoard_readcount(rs.getInt("board_readcount"));
	   			board.setBoard_date(rs.getTimestamp("board_date"));
	   		*/	
			}			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null) try { rs.close();}catch(Exception e) {}
			if(pstmt != null) try { pstmt.close();}catch(Exception e) {}
			if(con != null) try { con.close();}catch(Exception e) {}
		}		
		return board;
	}
	
	
	
//	  // 댓글 작성 public int boardReply(qna_board_dto board) { int result = 0;
//	  Connection con = null; PreparedStatement pstmt = null;
//	  
//	  // 부모글에 대한 정보 int re_ref = board.getBoard_re_ref(); // 글 그룹 번호 int re_lev =
//	  board.getBoard_re_lev(); // 댓글의 깊이 int re_seq = board.getBoard_re_seq(); //
//	  댓글의 출력순서
//	  
//	  try { con = getConnection();
//	  
//	  String sql="update model2 set board_re_seq=board_re_seq+1 ";
//	  sql+=" where board_re_ref=? and board_re_seq > ?";
//	  
//	  pstmt = con.prepareStatement(sql); pstmt.setInt(1, re_ref); pstmt.setInt(2,
//	  re_seq); pstmt.executeUpdate(); // SQL문 실행
//	  
//	  sql="insert into model2 values(model2_seq.nextval,";
//	  sql+="?,?,?,?,?,?,?,?,?,sysdate)";
//	  
//	  pstmt = con.prepareStatement(sql); pstmt.setString(1, board.getBoard_name());
//	  pstmt.setString(2, board.getBoard_pass()); pstmt.setString(3,
//	  board.getBoard_subject()); pstmt.setString(4, board.getBoard_content());
//	  pstmt.setString(5, ""); // board_file pstmt.setInt(6, re_ref); //
//	  board_re_ref pstmt.setInt(7, re_lev+1); // board_re_lev pstmt.setInt(8,
//	  re_seq+1); // board_re_seq pstmt.setInt(9, 0); // board_readcount result =
//	  pstmt.executeUpdate(); // SQL문 실행
//	  
//	  }catch(Exception e) { e.printStackTrace(); }finally { if(pstmt != null) try {
//	  pstmt.close();}catch(Exception e) {} if(con != null) try {
//	  con.close();}catch(Exception e) {} } return result; }
//	 
	
	// 글수정
	public int update(qna_board_dto board) {
		int result = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = getConnection();
			
		String sql="update qna_board set qb_subject=?,";
		       sql+="qb_content=? where qb_num=?";
		       
		    pstmt = con.prepareStatement(sql);
		    pstmt.setString(1, board.getQb_subject());
		    pstmt.setString(2, board.getQb_content());
		    pstmt.setInt(3, board.getQb_num());
		    result = pstmt.executeUpdate();		// SQL문 실행
		
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt != null) try { pstmt.close();}catch(Exception e) {}
			if(con != null) try { con.close();}catch(Exception e) {}
		}	
		return result;
	}
	//답글
		public int boardReply(qna_board_dto board) {
			int result=0;
			Connection con=null;
			PreparedStatement pstmt=null;
			
			//re 정보 미리 가져오기 (나중에 편하게)
			int re_ref=board.getQb_ref();
			int re_lev=board.getQb_lev();
			int re_seq=board.getQb_seq();
			
			try {
				con=getConnection();
			//기존 답글 존재한다면 순서 하나씩 뒤로 밀기
				String sql="update qna_board set qb_seq=qb_seq+1 ";
				sql+=" where qb_ref=? and qb_seq>?";
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, re_ref);	//부모글과 한 블럭인 글에 한정
				pstmt.setInt(2, re_seq);	//답글의 답글일 경우 부모 답글의 아래로 순서가 정렬돼야 함
				pstmt.executeUpdate();
				pstmt.close();
				
				sql="insert into QNA_BOARD values(qna_board_seq.nextval,?,?,?,sysdate,0,0,0)";
			       
	       		pstmt = con.prepareStatement(sql);
	     		pstmt.setString(1, board.getId());
	     		pstmt.setString(2, board.getQb_subject());
	       		pstmt.setString(3, board.getQb_content());
	       		pstmt.setInt(5, re_ref);
				pstmt.setInt(6, re_lev+1); //깊이 +1
				pstmt.setInt(7, re_seq+1); 	//답글 순서 1
				
				
				result = pstmt.executeUpdate();  
				
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				if(pstmt!=null) try { pstmt.close(); } catch(Exception e) { } ;
				if(con!=null) 	try { con.close();	 } catch(Exception e) { } ;
			}	
			return result;
		}
	
	
//	// 글삭제
//	public int delete(int board_num) {
//		int result = 0;
//		Connection con = null;
//		PreparedStatement pstmt = null;
//		
//		try {
//			con = getConnection();
//			
//			String sql="delete from model2 where board_num = ?";
//			
//			pstmt = con.prepareStatement(sql);
//			pstmt.setInt(1, board_num);
//			result = pstmt.executeUpdate();		// SQL문 실행
//			
//		}catch(Exception e) {
//			e.printStackTrace();
//		}finally {
//			if(pstmt != null) try { pstmt.close();}catch(Exception e) {}
//			if(con != null) try { con.close();}catch(Exception e) {}
//		}		
//		return result;
//	}
	
}
