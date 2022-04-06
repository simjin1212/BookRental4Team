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
				       
				
				
				result = pstmt.executeUpdate();   // SQL문 실행
				       
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				if(pstmt != null) try { pstmt.close();}catch(Exception e) {}
				if(con != null) try { con.close();}catch(Exception e) {}
			}
			return result;
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
	
	
}