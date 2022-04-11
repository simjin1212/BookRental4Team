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

import dto.rent_dto;
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
			
				String sql = "insert into reserve values(?, ?, ?, sysdate, reserve_seq.nextval)";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, reserve.getBook_Num());
				pstmt.setString(2, reserve.getId());				
				
				result = pstmt.executeUpdate();   // SQL문 실행
				       
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				if(pstmt != null) try { pstmt.close();}catch(Exception e) {}
				if(con != null) try { con.close();}catch(Exception e) {}
			}
			  return result;
		}
		
		// 예약내역
		public List<reserve_dto> getreserveList(String id) {
			List<reserve_dto> reservelist = new ArrayList<reserve_dto>();	
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;

			try {
				con = getConnection();

				String sql = "select rs.book_Num, rs.id, rs.reserve_Date, rs.reserve_Num, bk.book_Name, bk.Writer, bk.publisher from reserve rs, book bk ";
				sql += "where rs.book_num = bk.book_num and rs.id = ?";
				// 전체 게시글 목록
				System.out.println("id:" + id);
				System.out.println(sql);
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();

				while (rs.next()) {
					
					reserve_dto reserve = new reserve_dto();
					
					reserve.setBook_Num(rs.getInt("book_Num"));
					reserve.setId("id");
					reserve.setReserve_Date(rs.getDate("reserve_Date"));
					reserve.setReserve_Num(rs.getInt("reserve_Num"));
					reserve.setBook_Name(rs.getString("book_Name"));
					reserve.setWriter(rs.getString("writer"));
					reserve.setPublisher(rs.getString("publisher"));
					
					
					reservelist.add(reserve);
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if (rs != null)
					try {
						rs.close();
					} catch (Exception e) {
					}
				;
				if (pstmt != null)
					try {
						pstmt.close();
					} catch (Exception e) {
					}
				;
				if (con != null)
					try {
						con.close();
					} catch (Exception e) {
					}
				;
			}

			return reservelist;
		}
	
	
}
