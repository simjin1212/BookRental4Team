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

import dto.member_dto;
import dto.rent_dto;

public class rent_dao {
	
	// 싱글톤
	private static rent_dao instance = new rent_dao();

	public static rent_dao getInstance() {
		return instance;
	}
	
	// 컨넥션풀에서 컨넥션을 구해오는 메소드 
	private Connection getConnection() throws Exception{
		Context init = new InitialContext();
  		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/orcl");
  		return ds.getConnection();
	}

	//예시 대출목록 추가
		public int insert(rent_dto rent) {
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
		
	
	
	
}
