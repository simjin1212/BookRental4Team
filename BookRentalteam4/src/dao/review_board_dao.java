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
					
				String sql="insert into review_board values(10,review_board_seq.nextval,?,1,?,?,?,sysdate,0)";
				
				pstmt=con.prepareStatement(sql); 
				pstmt.setString(1, reviewboard.getId());
				pstmt.setString(2, reviewboard.getRb_Subject());
				pstmt.setString(3, reviewboard.getRb_Content());
				pstmt.setString(4, reviewboard.getRb_File());
			
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
		public int getCount() {
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
		
	/*
	 * // 글목록 public List<BoardBean> getList(int start, int end){ List<BoardBean>
	 * list = new ArrayList<BoardBean>(); Connection con = null; PreparedStatement
	 * pstmt = null; ResultSet rs = null;
	 * 
	 * try { con = getConnection();
	 * 
	 * String sql="select * from ( select rownum rnum, board.* from ";
	 * sql+=" ( select * from model2 order by board_re_ref desc, ";
	 * sql+=" board_re_seq asc) board ) "; sql+=" where rnum >= ? and rnum <= ?";
	 * 
	 * pstmt = con.prepareStatement(sql); pstmt.setInt(1, start); pstmt.setInt(2,
	 * end); rs = pstmt.executeQuery(); // SQL문 실행
	 * 
	 * while(rs.next()) { BoardBean board = new BoardBean();
	 * 
	 * board.setBoard_num(rs.getInt("board_num"));
	 * board.setBoard_name(rs.getString("board_name"));
	 * board.setBoard_pass(rs.getString("board_pass"));
	 * board.setBoard_subject(rs.getString("board_subject"));
	 * board.setBoard_content(rs.getString("board_content"));
	 * board.setBoard_file(rs.getString("board_file"));
	 * board.setBoard_re_ref(rs.getInt("board_re_ref"));
	 * board.setBoard_re_lev(rs.getInt("board_re_lev"));
	 * board.setBoard_re_seq(rs.getInt("board_re_seq"));
	 * board.setBoard_readcount(rs.getInt("board_readcount"));
	 * board.setBoard_date(rs.getTimestamp("board_date"));
	 * 
	 * list.add(board); }
	 * 
	 * }catch(Exception e) { e.printStackTrace(); }finally { if(rs != null) try {
	 * rs.close();}catch(Exception e) {} if(pstmt != null) try {
	 * pstmt.close();}catch(Exception e) {} if(con != null) try {
	 * con.close();}catch(Exception e) {} } return list; }
	 */
		
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
	
	
}
