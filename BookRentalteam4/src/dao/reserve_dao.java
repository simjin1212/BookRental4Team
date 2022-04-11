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


import dto.reserve_dto;

public class reserve_dao {
	
	// 싱글톤
	private static reserve_dao instance = new reserve_dao();

	public static reserve_dao getInstance() {
		return instance;
	}
	
	// 컨넥션풀에서 컨넥션을 구해오는 메소드 
	private Connection getConnection() throws Exception{
		Context init = new InitialContext();
  		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/orcl");
  		return ds.getConnection();
	}

	//예시 예약일 인서트
		public int insert(reserve_dto reserve) {
			int result = 0;
			Connection con = null;
			PreparedStatement pstmt = null;
			
			try {
				con = getConnection();
			
				String sql = "insert into reserve values(book_seq.nextval,?,?,?,?,?,sysdate,?,book_seq.nextval,0,0)";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, book.getBook_Name());
				pstmt.setString(2, book.getBook_Cover());
				pstmt.setString(3, book.getWriter());
				pstmt.setString(4, book.getPublisher());
				pstmt.setString(5, book.getGenre());
				pstmt.setString(6, book.getWriter_talks());
				result = pstmt.executeUpdate(); // SQL문 실행
				
				
				result = pstmt.executeUpdate();   // SQL문 실행
				       
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				if(pstmt != null) try { pstmt.close();}catch(Exception e) {}
				if(con != null) try { con.close();}catch(Exception e) {}
			}
			return result;
		}
		
	
	
	
}
