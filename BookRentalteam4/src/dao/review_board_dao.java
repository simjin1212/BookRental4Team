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

import dto.review_board_dto;


public class review_board_dao {
	
	// 싱글톤
	private static review_board_dao instance = new review_board_dao();

	public static review_board_dao getInstance() {
		return instance;
	}
	
	// 컨넥션풀에서 컨넥션을 구해오는 메소드 
	private Connection getConnection() throws Exception{
		Context init = new InitialContext();
  		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/orcl");
  		return ds.getConnection();
	}

	//예시 리뷰게시판 추가
	//리뷰 작성
		public int insert(review_board_dto reviewboard) {
			int result = 0;
			Connection con = null;
			PreparedStatement pstmt = null;
				
			System.out.println("db 입력 완료");
			try {
				con = getConnection();
					
				String sql="insert into review_board values(?,review_board_seq.nextval,?,?,?,?,?,sysdate,0)";
				
				pstmt=con.prepareStatement(sql); 
				pstmt.setInt(1, reviewboard.getBook_Num());
				pstmt.setString(2, reviewboard.getId());
				pstmt.setInt(3, reviewboard.getRent_Num());
				pstmt.setString(4, reviewboard.getRb_Subject());
				pstmt.setString(5, reviewboard.getRb_Content());
				pstmt.setString(6, reviewboard.getRb_File());
			
				result = pstmt.executeUpdate();   // SQL문 실행
					       
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				if(pstmt != null) try { pstmt.close();}catch(Exception e) {}
				if(con != null) try { con.close();}catch(Exception e) {}
			}
			return result;
		}
		
		//총 게시글 수
		public int rlgetCount() {
			int result = 0;
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs=null;
				
			try {
				con = getConnection();
				
				String sql="select count(*) from review_board";
				pstmt=con.prepareStatement(sql);
				rs=pstmt.executeQuery();
				
				if(rs.next()) {
					result=rs.getInt(1);	//count(*)
				}
			       
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				if(pstmt != null) try { pstmt.close();}catch(Exception e) {}
				if(con != null) try { con.close();}catch(Exception e) {}
			}
			return result;
		}
		
		// 글목록
		public List<review_board_dto> getList(int start, int end, int book_Num){
			List<review_board_dto> list = new ArrayList<review_board_dto>();
			Connection con  = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			try {
				con = getConnection();

				String sql="select * from review_board where rb_num >= ? and rb_num <=? and book_num = ? order by rb_num asc";
		   
		   		pstmt = con.prepareStatement(sql);
		   		pstmt.setInt(1, start);
		   		pstmt.setInt(2, end);
		   		pstmt.setInt(3, book_Num);
		   		
		   		rs = pstmt.executeQuery();		// SQL문 실행
		   		
		   		while(rs.next()) {
		   			review_board_dto review = new review_board_dto();
		   			
		   			review.setBook_Num(rs.getInt("book_num"));
		   			review.setRb_Num(rs.getInt("rb_num"));
		   			review.setId(rs.getString("id"));
		   			review.setRent_Num(rs.getInt("rent_num"));
		   			review.setRb_Subject(rs.getString("rb_subject"));
		   			review.setRb_Content(rs.getString("rb_content"));
		   			review.setRb_File(rs.getString("rb_file"));
		   			review.setRb_Regdate(rs.getTimestamp("rb_regdate"));
		   			review.setRb_Readcount(rs.getString("rb_readcount"));
		   			
		   			list.add(review);
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
		
		//조회수 증가
		public void readcountUpdate(int num) {
			Connection con=null;
			PreparedStatement pstmt=null;
			
			try {
				con=getConnection();
				
				String sql="update review_board set rb_readcount=rb_readcount+1 where rb_num=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, num);
				pstmt.executeUpdate();
				
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				if(pstmt!=null) try { pstmt.close(); } catch(Exception e) { } ;
				if(con!=null) 	try { con.close();	 } catch(Exception e) { } ;
			}
		}
	
		public review_board_dto getDetail(int board_num) {
			review_board_dto board = new review_board_dto();
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			try {
				con = getConnection();
				
				String sql="select * from review_board where rb_num = ?";
				
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, board_num);
				rs = pstmt.executeQuery();		// SQL문 실행
				
				if(rs.next()) {
					board.setBook_Num(rs.getInt("book_Num"));
					board.setRb_Num(rs.getInt("rb_Num"));
					board.setId(rs.getString("id"));
					board.setRent_Num(rs.getInt("rent_Num"));
					board.setRb_Subject(rs.getString("rb_Subject"));
					board.setRb_Content(rs.getString("rb_Content"));
					board.setRb_File(rs.getString("rb_File"));
					board.setRb_Regdate(rs.getTimestamp("rb_Regdate"));
					board.setRb_Readcount(rs.getString("rb_Readcount"));
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
}
