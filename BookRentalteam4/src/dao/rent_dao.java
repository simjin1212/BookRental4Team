// DAO(Data Access Object)

package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.book_dto;
import dto.member_board_dto;
import dto.member_dto;
import dto.rent_dto;

public class rent_dao {

	// 싱글톤
	private static rent_dao instance = new rent_dao();

	public static rent_dao getInstance() {
		return instance;
	}

	// 컨넥션풀에서 컨넥션을 구해오는 메소드
	private Connection getConnection() throws Exception {
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/orcl");
		return ds.getConnection();
	}

	// 대출목록 추가
	public int insert(rent_dto rent) {
		int result = 0;
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = getConnection();

			String sql = "insert into rent values(?,?,?,sysdate,sysdate+14)";

			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, rent.getRent_Num());
			pstmt.setInt(2, rent.getBook_Num());
			pstmt.setString(3, rent.getId());

			result = pstmt.executeUpdate(); // SQL문 실행

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (Exception e) {
				}
			if (con != null)
				try {
					con.close();
				} catch (Exception e) {
				}
		}
		return result;
	}

	// 대출내역
	public List<rent_dto> getRentList(String id) {
		List<rent_dto> rentlist = new ArrayList<rent_dto>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = getConnection();

			String sql = "select rt.book_num, bk.book_name, bk.writer, bk.publisher, rt.rent_num, rt.id, rt.rent_date, rt.return_date from rent rt, book bk ";
			sql += " where rt.book_num = bk.book_num and rt.id = ?";
			// 전체 게시글 목록
			System.out.println("id:" + id);
			System.out.println(sql);
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				rent_dto rent = new rent_dto();

				rent.setRent_Num(rs.getInt("rent_num"));
				rent.setBook_Num(rs.getInt("book_num"));
				rent.setId(rs.getString("id"));
				rent.setRent_Date(rs.getTimestamp("rent_date"));
				rent.setReturn_Date(rs.getDate("return_date"));
				rent.setTemp_book_Name(rs.getString("book_name"));
				rent.setTemp_Publisher(rs.getString("publisher"));
				rent.setTemp_Writer(rs.getString("writer"));

				rentlist.add(rent);
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

		return rentlist;
	}

	// 대출권수 확인
	public int getCount() {
		int result = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = getConnection();

			String sql = "select count(*) from rent ";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = rs.getInt(1); // count(*)
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (Exception e) {
				}
			if (con != null)
				try {
					con.close();
				} catch (Exception e) {
				}
		}
		return result;
	}
	// 대출권수 확인
		public int regetCount(String id) {
			int result = 0;
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;

			try {
				con = getConnection();

				String sql = "select count(*) from rent where id like '%"+id+"%' ";
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					result = rs.getInt(1); // count(*)
				}

			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if (pstmt != null)
					try {
						pstmt.close();
					} catch (Exception e) {
					}
				if (con != null)
					try {
						con.close();
					} catch (Exception e) {
					}
			}
			return result;
		}
	//미반납도서 목록
	public List<rent_dto> adminRentList(int start, int end) {
		List<rent_dto> rentlist = new ArrayList<rent_dto>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = getConnection();
			
			String sql="select * from (select rownum rnum, list.* from ";
					sql+=" (select rent.rent_num, rent.id, rent.book_num, book.book_name, book.writer, book.publisher, rent.rent_date, rent.return_date ";
					sql+=" from rent, book where rent.book_num=book.book_num order by rent.return_date asc) list ) where rnum>=? and rnum<=?";
					
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				rent_dto rent=new rent_dto();
				
				rent.setRent_Num(rs.getInt("rent_num"));
				rent.setId(rs.getString("id"));
				rent.setBook_Num(rs.getInt("book_num"));
				rent.setTemp_book_Name(rs.getString("book_name"));
				rent.setTemp_Writer(rs.getString("writer"));
				rent.setTemp_Publisher(rs.getString("publisher"));
				rent.setRent_Date(rs.getTimestamp("rent_date"));
				rent.setReturn_Date(rs.getDate("return_date"));
				
				rentlist.add(rent);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null) 		try { rs.close(); 	 } catch(Exception e) { } ;
			if(pstmt!=null) try { pstmt.close(); } catch(Exception e) { } ;
			if(con!=null) 	try { con.close();	 } catch(Exception e) { } ;
		}
		
		return rentlist;
	}
	
	//반납 처리
	public int returnbook(int num) {
		int result=0;
		Connection con=null;
		PreparedStatement pstmt=null;
		
		try {
			con=getConnection();
			
			String sql="delete from rent where rent_num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			result=pstmt.executeUpdate();
			
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			if(pstmt!=null) try { pstmt.close(); } catch(Exception e) { } ;
			if(con!=null) 	try { con.close();	 } catch(Exception e) { } ;
		}
		
		return result;
	}
	
	
	

	

}
