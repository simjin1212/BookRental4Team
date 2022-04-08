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

import dto.book_dto;
import dto.member_dto;




public class book_dao {
	
	// 싱글톤
	private static book_dao instance = new book_dao();

	public static book_dao getInstance() {
		return instance;
	}
	
	// 컨넥션풀에서 컨넥션을 구해오는 메소드 
	private Connection getConnection() throws Exception{
		Context init = new InitialContext();
  		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/orcl");
  		return ds.getConnection();
	}

	//예시 도서등록
		public int insert(book_dto book) {
			int result = 0;
			Connection con = null;
			PreparedStatement pstmt = null;
			
			try {
				con = getConnection();
			
				//String sql = "~~~"
				//pstmt = con.prepareStatement(sql);
				//pstmt.setString
				String sql = "insert into book values(book_seq.nextval,?,?,?,?,?,sysdate,?,book_seq.nextval,0,0)";
			       pstmt = con.prepareStatement(sql);
			       pstmt.setString(1, book.getBook_Name());
			       pstmt.setString(2, book.getBook_Cover());
			       pstmt.setString(3, book.getWriter());
			       pstmt.setString(4, book.getPublisher());
			       pstmt.setString(5, book.getGenre());
			       pstmt.setString(6, book.getWriter_talks());
			result = pstmt.executeUpdate();   // SQL문 실행      
				       
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				if(pstmt != null) try { pstmt.close();}catch(Exception e) {}
				if(con != null) try { con.close();}catch(Exception e) {}
			}
			return result;
		}
		//도서상세
		public book_dto getDetail(int book_num) {
			book_dto book = new book_dto();
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			try {
				con = getConnection();
				
				String sql="select * from book where book_num = ?";
				
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, book_num);
				rs = pstmt.executeQuery();		// SQL문 실행
				
				if(rs.next()) {
					book.setBook_Num(rs.getInt("book_num"));
		   			book.setBook_Name(rs.getString("book_name"));
		   			book.setBook_Cover(rs.getString("book_cover"));
		   			book.setWriter(rs.getString("writer"));
		   			book.setPublisher(rs.getString("publisher"));
		   			book.setGenre(rs.getString("genre"));
		   			book.setBook_regDate(rs.getDate("book_regDate"));
		   			book.setWriter_talks(rs.getString("writer_talks"));
				}			
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				if(rs != null) try { rs.close();}catch(Exception e) {}
				if(pstmt != null) try { pstmt.close();}catch(Exception e) {}
				if(con != null) try { con.close();}catch(Exception e) {}
			}		
			return book;
		}
		
	
		
		
	//도서 검색
		public int booksearch(String book_Name) {
			int result = 0;
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			try {
				con = getConnection();
				
				String sql = "select * from book where book_name=?";
						
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, book_Name);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					result = 1;		//도서 있음
				}else {
					result = -1;	//도서 없음
				}
			}catch (Exception e) {
				e.printStackTrace();
			}finally {
				if(pstmt != null) try { pstmt.close();
				}catch(Exception e) {	
					}if(con != null) try { con.close();}catch(Exception e) {
						}if(rs != null) try { rs.close();
							}catch(Exception e) {
								}
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
				
				String sql="select count(*) from book";
				
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
		
		//도서리스트
		public List<book_dto> getList(){
			List<book_dto> list = new ArrayList<book_dto>();
			Connection con  = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			try {
				con = getConnection();

	String sql = "select * from book order by book_num";
		   
		   		pstmt = con.prepareStatement(sql);
		   		rs = pstmt.executeQuery();		// SQL문 실행
		   		System.out.println("sql실행");
		   		while(rs.next()) {
		   			book_dto book = new book_dto();
		   			
		   			book.setBook_Num(rs.getInt("book_num"));
		   			book.setBook_Name(rs.getString("book_name"));
		   			book.setBook_Cover(rs.getString("book_cover"));
		   			book.setWriter(rs.getString("writer"));
		   			book.setPublisher(rs.getString("publisher"));
		   			book.setGenre(rs.getString("genre"));
		   			book.setBook_regDate(rs.getDate("book_regDate"));
		   			book.setWriter_talks(rs.getString("writer_talks"));
		   			
		   			book.setBook_ref(rs.getInt("book_ref"));
		   			book.setBook_lev(rs.getInt("book_lev"));
		   			book.setBook_seq(rs.getInt("book_seq"));
		   			
		   			
		   			list.add(book);
		   			
		   		}
		   		System.out.println("데이터 리스트에 저장완료");
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				if(rs != null) try { rs.close();}catch(Exception e) {}
				if(pstmt != null) try { pstmt.close();}catch(Exception e) {}
				if(con != null) try { con.close();}catch(Exception e) {}
			}		
			return list;
		}
		
		// 도서 수정
		public int update(book_dto book) {
			int result = 0;
			Connection con = null;
			PreparedStatement pstmt = null;
			
			try {
				con = getConnection();
				
			String sql="update book set book_name=?, genre=?, publisher=?, book_cover=?,";
			       sql+="book_writer_talks=? where book_num=?";
			       
			    pstmt = con.prepareStatement(sql);
			    pstmt.setString(1, book.getBook_Name());
			    pstmt.setString(2, book.getGenre());
			    pstmt.setString(3, book.getPublisher());
			    pstmt.setString(4, book.getBook_Cover());
			   pstmt.setString(5, book.getWriter_talks()); 
			   pstmt.setInt(6, book.getBook_Num());
			    result = pstmt.executeUpdate();		// SQL문 실행
			
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				if(pstmt != null) try { pstmt.close();}catch(Exception e) {}
				if(con != null) try { con.close();}catch(Exception e) {}
			}	
			return result;
		}
		
		//삭제
		public int delete(int book_Num) {
			int result = 0;
			Connection con = null;
			PreparedStatement pstmt = null;
			
			try {
				con = getConnection();
				
				String sql="delete from book where book_num = ?";
				
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, book_Num);
				result = pstmt.executeUpdate();		// SQL문 실행
				
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				if(pstmt != null) try { pstmt.close();}catch(Exception e) {}
				if(con != null) try { con.close();}catch(Exception e) {}
			}		
			return result;
		}
	
}
